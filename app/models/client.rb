class Client < ActiveRecord::Base

  after_initialize :init

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :password, :password_confirmation, :remember_me, :provider, :uid

  # Attributes for application
  attr_accessible :phone, :email, :name,
                  :institute, :preferred_location, 
                  :move_in, :move_out, :budget,
                  :room_size, :room_format, :building_age, :time_to_station,
                  :oneldk, :onedk, :onek

  attr_accessible :phone, :email, :name,
                  :institute, :preferred_location, 
                  :move_in, :move_out, :budget,
                  :room_size, :room_format, :building_age, :time_to_station,
                  :oneldk, :onedk, :onek,
                  :comment, :admin, :as => :admin

  has_many :properties

  def init
    self[:room_format] ||= ''
    self[:admin] ||= false
  end

  ROOM_FORMATS = [:oneldk, :onedk, :onek]

  ROOM_FORMATS.each do |format|
    define_method("#{format}=") do |enabled|
      if "0" == enabled
        enabled = false
      end

      room_formats = self[:room_format].split(/,/)

      if enabled
        room_formats.push(format) unless room_formats.include?(format)
      else
        room_formats.delete(format)     
      end

      self[:room_format] = room_formats.join(',')
    end

    define_method format do
      self[:room_format].include?(format.to_s)
    end
  end

  def self.all_but_id(id)
    Client.where("id != ?", id)
  end
end
