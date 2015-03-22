class Card < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :checklists, class_name: "CheckList", dependent: :destroy
  accepts_nested_attributes_for :checklists, allow_destroy: true
  belongs_to :project

  validates :project, :name, :description, :finished_hour, presence: true

end
