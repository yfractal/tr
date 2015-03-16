class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :contacts
      t.string :contacts_telephone
      t.text :desc
      t.string :site

      t.timestamps null: false
    end
  end
end
