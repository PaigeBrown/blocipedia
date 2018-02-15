class ChargesController < ApplicationController
    
    def create
        @amount = 10_00,
   
       customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
     
       charge = Stripe::Charge.create(
            customer: customer.id, 
            amount: 1000,
            description: "BigMoney Membership - #{current_user.email}",
            currency: 'usd'
        )
     
       current_user.update_attribute(:role, 'premium')
       
       flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
       redirect_to wikis_path 
       
        rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end
    
    def new
        @amount = 10_00,
        @stripe_btn_data = {
            key: "pk_test_fhhBFwNfJ2ZUJv74iCFQxKRd",
            description: "BigMoney Membership - #{current_user.email}",
            amount: @amount
        }
    end
end
