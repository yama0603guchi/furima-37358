class Address < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :postage_area
  # validates :postage_area_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :post_code,
  # format: { with: /\A\d{3}[-]\d{4}\z/, message: '3桁ハイフン4桁の半角文字列を使用してください'},
  # presence: true
  # validates :municipalities, presence: true
  # validates :street_number, presence: true
  # validates :building_name
  # validates :telephone_number,
  # format: { with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値を使用してください'},
  # presence: true
  belongs_to :order
end
