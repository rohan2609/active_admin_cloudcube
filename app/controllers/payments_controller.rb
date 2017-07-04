class PaymentsController < InheritedResources::Base
 def index
    @payments = Payment.all.order('created_at DESC')
  end
  private

    def payment_params
      params.require(:payment).permit(:mihpayid, :txnid, :status, :unmappedstatus, :amount, :cardCategory, :email, :name_on_card, :issuing_bank, :payment_mode, :customer_id, :plan_id)
    end
end

