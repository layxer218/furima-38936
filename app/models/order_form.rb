class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :area_id, :city, :build_name, :address, :phone_number, :token

  validates :user_id,       presence: true
  validates :item_id,       presence: true
  validates :zip_code,      presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :area_id,       presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :city,          presence: true
  validates :address,       presence: true
  validates :phone_number,  presence: true, format: { with: /\A[0-9]{10,11}+\z/ }
  validates :token,         presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Deliver.create(order_id: order.id, zip_code: zip_code, area_id: area_id, city: city, build_name: build_name, address: address, phone_number: phone_number)
  end

end