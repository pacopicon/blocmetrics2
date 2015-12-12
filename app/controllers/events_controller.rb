class EventsController < ApplicationController

  def create
    @regapp = Regapp.find(params[:regapp_id])
    @events = @regapp.events

    @event = @regapp.events.build(event_params)
    @new_event = Event.new

    if @event.saved
      flash[:notice] = "Event was successfully saved"
    else
      flahs[:error] = "The event could not be saved.  Please try again."
    end
  end

  def destroy
    @event = regapp.events.find(params[:id])

    if @event.destroy
      flash[:notice] = "\"#{@event.name}\" has successfully been deleted."
    else
      flash[:error] = "There was an error deleting this event.  Please try again!"
    end
  end

  def event_params
    params.require(:event).permit(:name)
  end

end
