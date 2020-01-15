class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming = @events.upcoming
    @previous = @events.previous
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event Created!'
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description,
                                  :location, :scheduled)
  end
end
