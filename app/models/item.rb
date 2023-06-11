class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :charge
  belongs_to :deliver_day
  belongs_to :item_state
  belongs_to :area

  belongs_to :user
  #belongs_to :order

  has_one_attached :image

  validates :item_name,       presence: true
  validates :explane,         presence: true
  validates :category_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :item_state_id,   numericality: { other_than: 1, message: "can't be blank"}
  validates :charge_id,       numericality: { other_than: 1, message: "can't be blank"}
  validates :area_id,         numericality: { other_than: 1, message: "can't be blank"}
  validates :deliver_day_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :price,           presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
