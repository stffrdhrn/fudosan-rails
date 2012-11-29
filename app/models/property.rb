class Property < ActiveRecord::Base
  attr_accessible :address, :name

  belongs_to :client
end
