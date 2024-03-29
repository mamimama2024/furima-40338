class ShippingFeeStatus < ActiveHash::Base
  self.data = [
    { id: 1, status: '---' },
    { id: 2, status: '着払い(購入者負担)' },
    { id: 3, status: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
