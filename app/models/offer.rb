class Offer < ApplicationRecord
  # create for score counting
  has_and_belongs_to_many :users
  # create for adding offer by user
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  validates :name, :description, :actual_price, :original_price, :url, presence: true
  validates :url,  uniqueness: true
  validates_numericality_of :original_price, greater_than: :actual_price

  def score
    users.count
  end

  def discount
    actual_price * 100 / original_price
  end
end
