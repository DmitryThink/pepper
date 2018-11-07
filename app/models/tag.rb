class Tag < ApplicationRecord
  has_and_belongs_to_many :admin_users
  has_and_belongs_to_many :offers
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
end
