class ChargesController < ApplicationController
  def create
   amount = Amount.new

   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: amount.default,
     description: "Marcipedia Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   current_user.update_attributes(role: 'premium')
   redirect_to edit_user_registration_path

 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end


def destroy

  if current_user.update_attributes(role: 'standard')
    flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to edit_user_registration_path
  else
    flash[:error] = "We couldnt downgrade you"
    redirect_to edit_user_registration_path
  end
end

def new
   amount = Amount.new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Marcipedia Premium Membership - #{current_user.name}",
     amount: amount.default
   }
 end

end

class Amount
  def default
    amount = 15_00
  end
end
