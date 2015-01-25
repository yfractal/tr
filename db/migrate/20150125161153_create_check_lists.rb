class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.string :name
      t.boolean :is_finished
      t.datetime :finished_at
      t.float :finished_hour
      t.references :card, index: true

      t.timestamps null: false
    end
    add_foreign_key :check_lists, :cards
  end
end
