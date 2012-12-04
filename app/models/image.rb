require 'RMagick'

class Image < ActiveRecord::Base
  attr_accessible :description, :file
  # view only attributes
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :property

  after_update :do_crop, :if => :cropping?

  mount_uploader :file, ImageUploader

  def cropping?
   !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?  
  end

  private

  def do_crop
    img = Magick::Image.read(file.path).first
    cropped_img = img.crop(crop_x.to_i, crop_y.to_i, crop_w.to_i, crop_h.to_i)
    cropped_img.resize!(600, 400)
    cropped_img.write(file.path)
    file.recreate_versions!
  end

end
