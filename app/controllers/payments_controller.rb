class PaymentsController < ApplicationController

	def create

	 token = params[:stripeToken]
	  product = Product.find(params[:product_id])
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => params[:product_price], # amount in cents, again
	      :currency => "gbp",
	      :source => token,
	      :description => params[:stripeEmail]
	    )
	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
	    err  = body[:error]
	    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  end
	  redirect_to product_path(product)
	  flash[:notice]='Product successfully paid for. You have been sent a confirmation Email'
	end
end
