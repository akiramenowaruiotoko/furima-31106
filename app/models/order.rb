class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :shpping_address
end
