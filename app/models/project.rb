class Project < ActiveRecord::Base
  belongs_to :company
  has_many :cards
  validates :company, :name, :desc, presence: true
end
