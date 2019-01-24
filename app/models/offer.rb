require 'uri'

class Offer < ApplicationRecord
  attr_reader :tag
  # create for score counting
  has_and_belongs_to_many :users
  # create for adding offers by user
  belongs_to :user, optional: true
  has_and_belongs_to_many :tags, -> { distinct }
  has_many :comments

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, :description, :actual_price, :original_price, :url, presence: true
  validates :url,  uniqueness: true
  validates_numericality_of :original_price, greater_than_or_equal_to: :actual_price
  validates :url, :format => URI::regexp(%w(http https))

  def score
    users.count
  end

  def discount
    (100 - actual_price * 100 / original_price).round(2)
  end
end
