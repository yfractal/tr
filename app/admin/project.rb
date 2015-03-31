ActiveAdmin.register Project do
  # actions :all, except: :show

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params "name", "desc", "company_id", "play_site", "production_site", "hour_fee"

  filter :name
  filter :company
  filter :hour_fee
  filter :total_hours
  filter :created_at
  filter :updated_at

  index do
    column :name do |pro|
      link_to pro.name, admin_card_path(pro)
    end
    column :company
    column :hour_fee
    column :total_hours
    column :total_amount
    column :created_at
    column :updated_at
    actions do |pro|
      link_to "需求", admin_cards_path("q[project_id_eq]" => pro.id)
    end
  end

  action_item :show, only: :show do
    link_to "需求列表", admin_cards_path("q[project_id_eq]" => resource.id)
  end

  show do |pro|
    attributes_table do
      Project.attribute_names.each do |attr_name|
        row attr_name
      end
      row :total_hours
      row :total_amount
      row :used_hours
      row :due
    end

    panel "需求列表" do
      paginated_collection(pro.cards.page(params[:page]).per(30)) do
        table_for(collection) do
          Card.attribute_names.each do |attr_name|
            next if attr_name == "project_id"
            column Card.human_attribute_name(attr_name), attr_name
          end
        end
      end
    end

  end


end
