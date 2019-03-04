class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :aws
  # storage :fog
  
  process resize_to_fit: [250,250]

    # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [30, 30]
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.jpg"].compact.join('_')
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
