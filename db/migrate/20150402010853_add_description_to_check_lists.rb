class AddDescriptionToCheckLists < ActiveRecord::Migration
  def change
    add_column :check_lists, :description, :text
  end
end
