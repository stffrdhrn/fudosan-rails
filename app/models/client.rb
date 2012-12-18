class Client < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me, :provider, :uid

  # Attributes for application
  attr_accessible :move_in, :move_out, :phone, :email, :name
  attr_accessible :move_in, :move_out, :phone, :email, :name, :admin, :as => :admin

  has_many :properties  

  def self.all_but_id(id)
    Client.where("id != ?", id)
  end
end
