class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :fee
  belongs_to_active_hash :place
  belongs_to_active_hash :status

  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name, :info, :image
    validates :price, format: { with: /\A[0-9]+\z/i }, inclusion: { in: 300..9_999_999 }
    validates :category_id, :status_id, :fee_id, :place_id, :day_id, numericality: { other_than: 0 }
  end

end
