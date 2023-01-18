class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  validates :item_name, :explain, :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_time_id, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
end
