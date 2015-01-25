class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.float :finished_hour

      t.timestamps null: false
    end
  end
end
