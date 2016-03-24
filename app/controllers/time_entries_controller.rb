class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :destroy, :update]

  def index
    @time_entries = TimeEntry.all
  end

  def show
  end

  def new
    @time_entries = TimeEntry.new
  end

  def edit
  end

  def create
    @time_entries = TimeEntry.new(time_entry_params)

    if @time_entries.save
      redirect_to @time_entries, notice: 'TimeEntry was successfully created.'
    else
      render :new
    end
  end



  def update
      if @time_entries.update(TimeEntry_params)
        redirect_to @time_entries, notice: 'TimeEntry was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @time_entries.destroy

      redirect_to TimeEntries_url, notice: 'TimeEntry was successfully destroyed.'

  end

  private
    def set_TimeEntry
      @time_entries = TimeEntry.find(params[:id])
    end

    def TimeEntry_params
      params.require(:TimeEntry).permit(:project_id, :developer_id, :duration, :date)
    end

end
