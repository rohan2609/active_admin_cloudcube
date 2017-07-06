ActiveAdmin.register OfflinePayment do
  filter :plan, :as => :select, :collection => Plan.all.map { |c| [c.plan_name,c.id]  }
  filter :customer , :as => :select, :collection => Customer.all.map { |c| [c.fullname,c.id]  }
	
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :customer_id,:plan_id,:amount,:date,:check_number,:bank_name,:date_on_check
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form do |f|
      f.inputs "Offline Details" do
      f.input :plan_id, :as => :select, :collection => Plan.all.map { |c| [c.plan_name,c.id]  }
      f.input :customer_id, :as => :select, :collection => Customer.all.map { |c| [c.fullname,c.id]  }
      f.input :bank_name
      f.input :check_number
      f.input :amount
      f.input :date,:as => :datetime_picker,  :input_html => {:value => Date.today}
      f.input :date_on_check,as: :datetime_picker

end
  f.actions
end
   

index do
  id_column
  column "Customer" do |m|
   usr = Customer.find(m.customer_id).fullname
 end
  column :plan
  column :bank_name
  column :check_number
  column :amount
   actions defaults: false do |offline_payment|
   a "View", href: admin_offline_payment_path(offline_payment)
   item "Edit", edit_admin_offline_payment_path(offline_payment)
  end
end

end
