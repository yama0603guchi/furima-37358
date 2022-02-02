class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:post_code,:postage_area_id,:municipalities,:street_number,:building_name,:telephone_number,:order_id

  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to_active_hash :postage_area
  validates :postage_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :post_code,
            format: { with: /\A\d{3}[-]\d{4}\z/, message: '3桁ハイフン4桁の半角文字列を使用してください'},
            presence: true
  validates :municipalities, presence: true
  validates :street_number, presence: true
  validates :telephone_number,
            format: { with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値を使用してください'},
            presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  #validates :order_id, presence: true

  def save
    order = Order.create(item_id: item_id,user_id: user_id )
     Address.create(post_code: post_code,postage_area_id: postage_area_id,municipalities: municipalities,street_number: street_number,building_name: building_name,telephone_number: telephone_number,order_id: order.id)
  end
end
