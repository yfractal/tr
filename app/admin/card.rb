ActiveAdmin.register Card do

  permit_params :name, :description, :finished_hour, checklists_attributes: [:_destroy,
    :id, :name, :is_finished, :finished_at, :finished_hour]

    filter :name
    filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :finished_hour
    column :created_at
    column :updated_at
    actions
  end

  show do |card|
    attributes_table do
      Card.attribute_names.each do |attr_name|
        row attr_name
      end
    end

    panel "任务列表" do
      paginated_collection(card.checklists.page(params[:page]).per(15)) do
        table_for(collection) do
          CheckList.attribute_names.each do |attr_name|
            next if attr_name == "card_id"
            column CheckList.human_attribute_name(attr_name), attr_name
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :finished_hour
    end

    f.inputs "任务列表" do
      f.has_many :checklists, heading: false, allow_destroy: true do |checklist|
        checklist.semantic_errors *checklist.object.errors.keys
        checklist.input :name
        checklist.input :finished_hour
        checklist.input :finished_at
        checklist.input :is_finished
      end
    end
    f.actions
  end


end
