class DevelopersController < ApplicationController

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

# DELETE /answers/1
def destroy
  @developer.destroy
  redirect_to developer_url, notice: 'Developer was successfully destroyed.'
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @developer = Developer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def developer_params
    params.require(:developer).permit(:email, :password, :name)
  end
end
