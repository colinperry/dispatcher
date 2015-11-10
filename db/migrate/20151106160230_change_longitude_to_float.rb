class ChangeLongitudeToFloat < ActiveRecord::Migration
  def change
  	change_column :users, :longitude, :float
  end
end
