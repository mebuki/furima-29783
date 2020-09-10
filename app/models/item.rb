class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :fee
  belongs_to_active_hash :place
  belongs_to_active_hash :status

  validates :name, :info, :category, :status, :fee, :place, :day, :price, presence: true
  validates :category, :status, :fee, :place, :day, numericality: { other_than: 0 }
  validates :price, format: { with: /\A[0-9]+\z/i }, inclusion: { in: 300..9_999_999 } 
end
