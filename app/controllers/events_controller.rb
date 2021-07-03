# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.where(user_id: current_user.id)
  end

  def show
    object = Event.find(params[:id])
    if current_user.id == object.user_id
      @event = Event.find(params[:id])
    else
      render "#{Rails.root}/public/404.html", status: 404
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path
    else
      redirect_to events_path
    end
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

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_date, :end_date, :start_time, :end_time, :paid)
  end
end
