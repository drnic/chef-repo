current_dir = File.dirname(__FILE__)
user        = ENV['OPSCODE_USER'] || ENV['USER']
orgname     = ENV['OPSCODE_ORGNAME'] || ENV['ORGNAME'] || "#{user}-test"
chef_home   = "#{ENV['HOME']}/.chef"
log_level                :info
log_location             STDOUT
node_name                user
client_key               "#{chef_home}/#{user}.pem"
validation_client_name   "#{orgname}-validator"
validation_key           "#{chef_home}/#{orgname}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{orgname}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
