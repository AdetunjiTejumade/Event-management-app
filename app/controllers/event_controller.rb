class EventController < ApplicationController
  def index
    @event = Event.all
  end
end
