class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  belongs_to :user
  has_one_attached :image
  has_one :order
  
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id 
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price
    validates :image
  end

  validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id 
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

end
