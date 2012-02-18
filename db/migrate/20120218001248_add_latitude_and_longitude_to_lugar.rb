class AddLatitudeAndLongitudeToLugar < ActiveRecord::Migration
  def change
    add_column :lugares, :latitude, :float
    add_column :lugares, :longitude, :float
  end
end
