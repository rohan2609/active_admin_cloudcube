class CreateOfflinePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :offline_payments do |t|
      t.references :customer, foreign_key: true
      t.references :plan, foreign_key: true
      t.string :amount
      t.date :date
      t.string :check_number
      t.string :bank_name
      t.date :date_on_check

      t.timestamps
    end
  end
end
