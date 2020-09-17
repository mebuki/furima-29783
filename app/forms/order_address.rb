class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_number, :place_id, :city, :street, :building, :tell_number

  with_options presence: true do
    validates :place_id, numericality: { other_than: 0 }
    validates :user_id, :item_id, :city, :street, :token
    validates :tell_number, format: { with: /\A\d{,11}\z/ }
  end

  POSTAL_CODE_REGAX = validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }, presence: true

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, place_id: place_id, city: city, street: street, building: building, tell_number: tell_number, order_id: @order.id)
  end
end
