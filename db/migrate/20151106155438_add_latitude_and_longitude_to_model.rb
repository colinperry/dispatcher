class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
  	rename_column :users, :lat, :latitude
  end
end
