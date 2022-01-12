class SessionsController < ApplicationController
  def create
    # Delete these 4 lines once the authenticate_with_credentials method passes all it's test cases
    # user = User.find_by_email(params[:email])
    # # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])

    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form with error message.
      redirect_to '/login', alert: 'Email or password is incorrect'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
