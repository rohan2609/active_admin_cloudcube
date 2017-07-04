ActiveAdmin.register Customer do
  filter :fullname, :label => 'Customer Name', :as => :select, if: proc{Customer.all.map { |c| [c.fullname,c.id]  }}
   filter :status, :label => 'Active(true)/Inactive(false)', :as => :select, if: proc{Customer.all.map { |c| [c.status,c.id]  }}
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :fullname,:contact, :email, :customer,:date,:status,:address,:pincode,:plan_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


form do |f|
    f.inputs "Customer Details",{:multipart => true} do
 f.input :customer,
      :input_html => {:value => Customer.first.nil? ? 'C' + Date.today.strftime('%Y%m%d').to_s + 
'1' : 'C' +  Date.today.strftime('%Y%m%d').to_s + Customer.last.id.next.to_s }
      f.input :fullname 
      f.input :plan_id, :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]},:input_html => { :class => "chosen-input" }
      f.input :date, :as => :datepicker,  :input_html => {:value => Date.today}
      f.input :address
      f.input :pincode
      f.input :contact
      f.input :email
      f.input :status, :as => :radio, :label => "Active/Inactive",:collection => [true, false]  
    end
    f.actions
  end


  index do
  column :customer
  column :fullname
  column :contact
  column :status  
  actions defaults: false do |customer|
   a "View", href: admin_customer_path(customer)
   item "Edit", edit_admin_customer_path(customer)  
  
 end
end
end
