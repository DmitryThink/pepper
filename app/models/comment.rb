class Comment < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :text, presence: true
end
