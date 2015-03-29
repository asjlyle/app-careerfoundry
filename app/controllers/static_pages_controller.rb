class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	@products=Product.limit(3)
  end

def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  logger.info('before')
  ActionMailer::Base.mail(:from => @email, 
      :to => 'a.sjlyle@gmail.com', 
      :subject => "A new contact form message from #{@name}", 
      :body => @message).deliver
  logger.info('after')
end


end

