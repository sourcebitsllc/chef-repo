app = node.run_state[:current_app]
api_server_url = "#{app['api_server_url']}"
rails_port = "#{app['rails_port']}"

include_recipe "nginx"

template "#{node[:nginx][:dir]}/sites-available/default" do
  source "#{app['nginx']['site_template']}"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[nginx]"
  variables app.to_hash
end

service "nginx" do
  action :start
end
