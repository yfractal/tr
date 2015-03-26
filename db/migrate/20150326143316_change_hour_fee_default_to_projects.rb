class ChangeHourFeeDefaultToProjects < ActiveRecord::Migration
  def change
    change_column_default :projects, :hour_fee, 0
  end
end
