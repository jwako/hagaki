# encoding: utf-8
class MessageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog
  storage :file
  
  process :auto_orient # this should go before all other "process" steps

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end
 
  def default_url
    "/assets/default.png"
  end

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
