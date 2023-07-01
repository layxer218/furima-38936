class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :area_id, :city, :build_name, :address, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Deliver.create(order_id: order.id, zip_code: zip_code, area_id: area_id, city: city, build_name: build_name,
                   address: address, phone_number: phone_number)
  end
end
