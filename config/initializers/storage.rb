CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        region: 'us-east-2'
    }
    config.fog_directory  = "exp-management-bucket"
    config.fog_public     = false
  end