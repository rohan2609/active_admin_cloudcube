class PlansController < InheritedResources::Base

  private

    def plan_params
      params.require(:plan).permit(:plan_name, :plan_price, :plan_rent, :no_of_days, :speed)
    end
end

