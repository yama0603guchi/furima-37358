class Form 
  include ActiveModel::Model
  attr_accessor :item,:user,:post_code,:postage_area_id,:municipalities,:street_number,:building_name,:telephone_number,:order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_area
  validates :post_code, presence: true
  validates :municipalities, presence: true
  validates :street_number, presence: true
  validates :building_name
  validates :telephone_number, presence: true

  def save
    Order.create(:item,:user)
    Address.create(:post_code,:postage_area_id,:municipalities,:street_number,:building_name,:telephone_number,:order)
  end
end
