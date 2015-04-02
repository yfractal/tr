class Card < ActiveRecord::Base
  has_paper_trail

  validates :name, :description, presence: true
  has_many :checklists, class_name: "CheckList", dependent: :destroy
  accepts_nested_attributes_for :checklists, allow_destroy: true
  belongs_to :project

  validates :project, :name, :description, :finished_hour, presence: true

  before_validation :init_finished_hour

  scope :dones, ->{where(is_done: true)}

  def done
    update_attribute(:is_done, true)
  end

  def undone
    update_attribute(:is_done, false)
  end

  private

    def init_finished_hour
      self.finished_hour = checklists.sum(:finished_hour)
    end

end
