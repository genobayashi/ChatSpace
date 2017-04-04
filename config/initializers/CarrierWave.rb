CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'ACCESS_KEY',
      :aws_secret_access_key  => 'SECRET_KEY',
      :region                 => 'ap-northeast-1',
  }
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  case Rails.env
    when 'production'
      config.fog_directory = 'gen-chat-space-image-bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/gen-chat-space-image-bucket'
    when 'development'
      config.fog_directory = 'gen-chat-space-image-bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.gen-chat-space-image-bucket'
    when 'test'
      config.fog_directory = 'gen-chat-space-image-bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.gen-chat-space-image-bucket'
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
