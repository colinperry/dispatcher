class ChangeLonToLongitude < ActiveRecord::Migration
  def change
  	rename_column :users, :lon, :longitude
  end
end
