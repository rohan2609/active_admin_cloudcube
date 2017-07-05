class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_save :send_signup_email


  def send_signup_email
    UserMailer.send_signup_email(self).deliver_now
  end

  def create_user_customer(customer,email)
    customer.each do |customer|
      UserCustomer.create(email: email, customer: customer)
    end
  end
end