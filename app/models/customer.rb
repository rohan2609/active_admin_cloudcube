class Customer < ApplicationRecord
  belongs_to :plan
  has_many :offline_payments
  has_many :payments
  validates :contact, numericality: { only_integer: true }, length: \
          { minimum: 6, maximum: 11 }, allow_blank: true
  validates :address, length: { in: 1..50 }, allow_blank: true
  after_save :create_user_account
  #before_create :set_access_token


private

 # def set_access_token
 #    self.access_token = SecureRandom.hex(10)
 #  end

 #  def generate_token
 #    loop do
 #      token = SecureRandom.hex(10)
 #      break token unless Customer.where(access_token: token).exists?
 #      Customer.update(access_token: token)
 #    end
 #  end

 def create_user_account
    user = User.new do |u|
      u.email = email
      u.password = customer
      u.save
    end

  end

end

