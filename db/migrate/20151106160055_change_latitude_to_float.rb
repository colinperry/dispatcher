class ChangeLatitudeToFloat < ActiveRecord::Migration
  def change
  	change_column :users, :latitude, :float
  end
end
