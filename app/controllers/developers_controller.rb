class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def index
    @developer = Developer.all
  end

  def show
  end

  def new
    @developer = Developer.new
  end

  def edit
  end

  def create
    @developer = Developer.new(developer_params)
    if !session[:user_id].nil?
      flash[:notice] = "Please logout of current session before creating a new account."
      redirect_to root_path
    elsif @developer.save
      session[:user_id] = @developer.id
      redirect_to show_developer_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def update
      if @developer.update(developer_params)
        redirect_to @developer, notice: 'Developer was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @developer.destroy

      redirect_to developers_url, notice: 'Author was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:name, :email, :password)
    end

end
