class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :destroy, :update]

  def index
    @time_entries = TimeEntry.all
  end

  def show
  end

  def new
    @time_entry = TimeEntry.new
  end

  def edit
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)

    if @time_entry.save
      redirect_to @time_entry, notice: 'TimeEntry was successfully created.'
    else
      render :new
    end
  end



  def update
      if @time_entry.update(time_entry_params)
        redirect_to @time_entry, notice: 'TimeEntry was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @time_entry.destroy

      redirect_to time_entries_url, notice: 'TimeEntry was successfully destroyed.'

  end

  private
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:project_id, :developer_id, :duration, :date_on)
    end

end
