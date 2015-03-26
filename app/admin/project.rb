ActiveAdmin.register Project do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params "name", "desc", "company_id", "play_site", "production_site", "hour_fee"

  index do
    column :name
    column :company
    column :hour_fee
    column :total_hours
    column :total_amount
    column :created_at
    column :updated_at
    actions
  end

  show do |pro|
    attributes_table do
      Project.attribute_names.each do |attr_name|
        row attr_name
      end
      row :total_hours
      row :total_amount
    end
  end


end
