class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :plan_price
      t.string :plan_rent
      t.string :no_of_days
      t.string :speed

      t.timestamps
    end
  end
end
