class AddColumnsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :provider, :string
    add_column :clients, :uid, :string
  end
end
