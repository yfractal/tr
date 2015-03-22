class Company < ActiveRecord::Base
  has_many :projects

  validates :contacts, :name, :contacts_telephone, :desc, presence: true
end
