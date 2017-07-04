class OfflinePaymentsController < InheritedResources::Base
	def new
		@offline_payment = OfflinePayment.new	
	end

	def create
		@offline_payment = OfflinePayment.new(offline_payment_params)
		if @offline_payment.save
		redirect_to offline_payment_path(@offline_payment)
	else
		render 'new'
	end
	end

	def index
		@offline_payments = OfflinePayment.all
	end

	def show
		@offline_payment = OfflinePayment.find(params[:id])
	end
  private

    def offline_payment_params
      params.require(:offline_payment).permit(:customer_id, :plan_id, :amount, :date, :check_number, :bank_name, :date_on_check)
    end
end

