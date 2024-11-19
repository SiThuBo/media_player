class MediaUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  require 'streamio-ffmpeg'

  storage :file

  def extension_whitelist
    %w[jpg jpeg gif png mp4 mp3 wav]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb, if: :image? do
    process :resize_image
  end

  version :video_thumb, if: :video? do
    process :generate_video_thumb
  end

  def generate_video_thumb
    movie = FFMPEG::Movie.new(file.path)
    movie.screenshot(File.join(File.dirname(file.path), 'thumb.jpg'), seek_time: 5)
  end

  def resize_image
    # Resize using MiniMagick's resize_to_limit or resize_to_fill methods
    manipulate! do |img|
      img.resize "200x200^"
      img.gravity "Center"
      img.extent "200x200"
      img
    end
  end

  private

  def image?(new_file)
    new_file.content_type.start_with?('image')
  end

  def video?(new_file)
    new_file.content_type.start_with?('video')
  end

  def audio?(new_file)
    new_file.content_type.start_with?('audio')
  end
end
