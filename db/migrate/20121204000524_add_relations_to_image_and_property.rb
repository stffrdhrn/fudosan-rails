class AddRelationsToImageAndProperty < ActiveRecord::Migration
  def change
    add_column :images, :property_id, :string
  end
end
