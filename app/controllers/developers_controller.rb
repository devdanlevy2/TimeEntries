class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:new, :create]

  def index
    @developers = Developer.all
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
    if @developer.save
      redirect_to @developer, notice: 'Developer was successfully created.'
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

      redirect_to developers_url, notice: 'Developer was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:email, :name, :password)
    end

end
