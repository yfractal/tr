class Project < ActiveRecord::Base
  has_paper_trail

  belongs_to :company
  has_many :cards
  validates :company, :name, :desc, presence: true
end
