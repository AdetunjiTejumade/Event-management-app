class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_date, :end_date, :start_time, :end_time, :paid)
  end
end
