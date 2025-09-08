class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :address, :building, :phone, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correnctly"}
  end

  validates :prefecture, numericality: {other_than: 0, message: "Select"}

  with_options presence: true do
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "input only number with 10 or 11 digits", allow_blank: true }
    validates :user_id
  end

  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end