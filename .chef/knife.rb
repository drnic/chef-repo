current_dir = File.dirname(__FILE__)
user        = ENV['OPSCODE_USER'] || ENV['USER']
ENV['ORGNAME'] ||= (ENV['OPSCODE_ORGNAME'] || "#{user}-test")
orgname     = ENV['ORGNAME']
chef_home   = "#{ENV['HOME']}/.chef"

knife[:aws_access_key_id]     = ENV['AWS_ACCESS_KEY_ID'] || Fog.credentials[:aws_access_key_id]
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY'] || Fog.credentials[:aws_secret_access_key]
knife[:identity_file]         = '~/.ec2/id_rsa-ec2'
knife[:aws_ssh_key_id]        = ENV['AWS_SSH_KEY_ID'] || 'drnic'
knife[:availability_zone]     = 'eu-east-1a'
knife[:region]                = 'eu-east-1'
knife[:aws_image_id]          = 'ami-a403f7cd' # http://aws.amazon.com/amis/Community/4347

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
