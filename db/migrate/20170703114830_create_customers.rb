class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :contact
      t.string :email
      t.string :access_token
      t.string :customer
      t.date :date
      t.boolean :status
      t.string :address
      t.string :pincode
      t.references :plan
      t.timestamps
    end
  end
end
