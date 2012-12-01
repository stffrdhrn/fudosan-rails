class Image < ActiveRecord::Base
  attr_accessible :description, :file

  mount_uploader :file, ImageUploader
end
