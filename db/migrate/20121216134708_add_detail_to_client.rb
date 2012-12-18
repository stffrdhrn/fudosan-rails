class AddDetailToClient < ActiveRecord::Migration
  def change
    add_column :clients, :phone, :string
    add_column :clients, :move_in, :date
    add_column :clients, :move_out, :date
    add_column :clients, :institute, :string # school, work
    add_column :clients, :preferred_location, :string # station, city
    add_column :clients, :budget, :string
    add_column :clients, :space_min, :integer # 50 sq m
    add_column :clients, :space_max, :integer # 100 sq m
    add_column :clients, :room_format, :string # 1ldk, 1dk, 1k
    add_column :clients, :building_age, :integer # 10 years, 5 years, new
    add_column :clients, :time_to_station, :integer # 10 mins, 3 mins
    add_column :clients, :comment, :string

  end
end
