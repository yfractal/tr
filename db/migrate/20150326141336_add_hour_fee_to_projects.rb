class AddHourFeeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :hour_fee, :float
  end
end
