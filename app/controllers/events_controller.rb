class EventsController < ApplicationController
  def show
  end

  def new
    @event = User.find(session[:user_id]).created_events.build
  end

  def create
    @event = User.find(session[:user_id]).created_events.build(event_params)
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_time, :end_time, :content)
  end
end
