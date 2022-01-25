class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :item_condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :postage_area
  belongs_to_active_hash :preparation_day

  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_player_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
end
