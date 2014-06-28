bucket = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]['bucket']

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['JQ_AWS_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['JQ_AWS_SECRET_KEY']
  }
  config.fog_directory  = bucket
  # config.fog_public     = false
end