class AuthenticationsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if params[:email]
      user && user.authenticate(params[:password])
      redirect_to root_url, notice: "Signed in!"
    else
      flash.now[:notice] = "You need to log in before you can do anything!"
      render "new"
    end
  end
end
