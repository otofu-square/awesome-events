class EventsController < ApplicationController
  before_action :authenticate

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = User.find(session[:user_id]).created_events.build
  end

  def create
    @event = User.find(session[:user_id]).created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: '作成しました。'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_time, :end_time, :content)
  end
end
