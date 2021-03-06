class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      log_in user
      #redirect_to user
  	  redirect_back_or user
  		#Log in the user to show his page
  	else
  		#Create an error message
  		flash.now[:danger] = 'Invalid username/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

end
