class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id, :city, :address, :user_id, :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                           building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
