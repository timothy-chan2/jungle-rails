class UsersController < ApplicationController
  def new
  end

  def create
    msg = "
    
    
    
    4. Password is at least 4 characters long"
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/new',
      alert: 'Failed to create account. Please make sure all the requirements below were followed.'
      
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email.downcase, :password, :password_confirmation)
  end
end