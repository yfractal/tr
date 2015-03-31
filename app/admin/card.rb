ActiveAdmin.register Card do

  permit_params :name, :is_done, :description, :finished_hour, :project_id, checklists_attributes: [:_destroy, :id, :name, :is_finished, :finished_at, :finished_hour]

  filter :name
  filter :project
  filter :is_done
  filter :created_at

  batch_action :done, confirm: "你确认完成吗？" do |ids|
    cards = collection.where(id: ids)
    cards.update_all(is_done: true)
    redirect_to :back
  end

  member_action :done do
    resource.done
    response do |format|
      format.js
    end
  end
  member_action :undone do
    resource.undone
    response do |format|
      format.js
    end
  end

  index do
    selectable_column
    column :name
    column :project
    column :is_done
    column :finished_hour
    column :created_at
    column :updated_at
    actions do |card|
      if card.is_done?
        link_to "重新开始", undone_admin_card_path(card), remote: true, id: "undone-#{card.id}", data: {confirm: "确认重新开始吗？"}
      else
        link_to "完成", done_admin_card_path(card), remote: true, id: "done-#{card.id}", data: {confirm: "确认完成此需求吗？"}
      end
    end
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
      f.input :project
      f.input :name
      f.input :finished_hour
      f.input :is_done
      f.cktext_area :description, {ckeditor: {language: "zh-CN"}}
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
