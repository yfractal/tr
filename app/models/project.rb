class Project < ActiveRecord::Base
  has_paper_trail

  belongs_to :company
  has_many :cards
  validates :hour_fee, :company, :name, :desc, presence: true

  # 总费用
  def total_amount
    total_hours * hour_fee
  end

  def total_hours
    CheckList.where(card_id: card_ids).sum(:finished_hour) || 0
  end
end
