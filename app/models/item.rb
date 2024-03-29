class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :charge
  belongs_to :deliver_day
  belongs_to :item_state
  belongs_to :area

  belongs_to :user
  has_one :order

  has_one_attached :image

  validates :image,           presence: true
  validates :item_name,       presence: true
  validates :explane,         presence: true
  validates :category_id,     numericality: { other_than: 1, message: "を入力してください" }
  validates :item_state_id,   numericality: { other_than: 1, message: "を入力してください" }
  validates :charge_id,       numericality: { other_than: 1, message: "を入力してください" }
  validates :area_id,         numericality: { other_than: 1, message: "を入力してください" }
  validates :deliver_day_id,  numericality: { other_than: 1, message: "を入力してください" }
  validates :price,           presence: true,
                              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
