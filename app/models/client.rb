class Client < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :properties  
end
