class AddDescriptionToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :describe, :text
  end
end
