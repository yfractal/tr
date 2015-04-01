class AddIsDoneToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_done, :boolean, default: false
  end
end
