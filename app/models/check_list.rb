class CheckList < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :card
end
