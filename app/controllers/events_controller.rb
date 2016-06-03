class EventsController < ApplicationController
  def show
  end

  def new
    @event = User.find(session[:user_id]).created_events.build
  end

  def create
    @event = User.find(session[:user_id]).created_events.build
    redirect_to @event
  end
end
