class OfflinePayment < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  scope :shod, ->(id) {where(id: id).take}
end
