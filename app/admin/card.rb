ActiveAdmin.register Card do

  permit_params :name, :description, :finished_hour, checklists_attributes: [:_destroy,
    :id, :name, :is_finished, :finished_at, :finished_hour]

  index do
    selectable_column
    id_column
    column :name
    column :finished_hour
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :finished_hour
    end

    f.inputs "Check List" do
      f.has_many :checklists, heading: false, allow_destroy: true do |checklist|
        checklist.semantic_errors *checklist.object.errors.keys
        checklist.input :name
        checklist.input :finished_hour
        checklist.input :finished_at, as: :datetime_picker
        checklist.input :is_finished
      end
    end
    f.actions
  end


end
