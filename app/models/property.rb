class Property < ActiveRecord::Base
  attr_accessible :address, :name

  belongs_to :client
  has_many :images, :dependent => :destroy
end
