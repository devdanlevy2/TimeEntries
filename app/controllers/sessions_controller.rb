class SessionsController < ApplicationController
  before_action :set_developer, only: [:edit, :update, :delete]
  before_action :authenticate, except: [:new, :create]

  def new
    @developer = Developer.new
  end

  def show
  end

  def create
    developer = Developer.find_by_email(params[:email])

    if developer && developer.authenticate(params[:password])
      session[:user_id] = developer.id
      redirect_to developers_path, notice: "You have successfully logged in!"
    else
      flash[:alert] = "Login failed: invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have logged out."
  end
end
