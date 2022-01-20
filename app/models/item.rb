class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_player
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :preparation_day
end
