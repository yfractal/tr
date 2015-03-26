class AddIsDoneToCards < ActiveRecord::Migration
  def change
    add_column :cards, :is_done, :boolean, default: false
  end
end
