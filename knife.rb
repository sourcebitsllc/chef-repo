current_dir = File.dirname(__FILE__)
user = ENV['OPSCODE_USER'] || ENV['USER']
log_level                :info
log_location             STDOUT
node_name                user
client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
validation_client_name   "chef-validator"
validation_key           "#{ENV['HOME']}/.chef/validation.pem"
chef_server_url          "http://kosmos-chef.sourcebits.com:4000"
cache_type               "BasicFile"
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path [ "#{current_dir}/../cookbooks" ]
