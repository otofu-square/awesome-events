class EventsController < ApplicationController
  def new
    @event = User.find(session[:user_id]).created_events.build
  end
end
