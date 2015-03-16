class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :desc
      t.references :company, index: true
      t.string :play_site
      t.string :production_site

      t.timestamps null: false
    end
    add_foreign_key :projects, :companies
  end
end
