class HomeController < ApplicationController
  skip_before_filter :find_event_by_slug, :only => [:show]
  # Go to:
  # - the currently live event guidelines page, or
  # - /events if no current event
  def show
    #@event = Event.live.first
    #if @event
      #redirect_to event_url(@event.slug)
    #else
      #redirect_to events_url
    #end
    event = Event.find_by(slug: params[:slug])
    @speaker = Speaker.find(params[:id])
  end
  
  def index
    #@event = Event.all
    #rooms = @event.rooms
    #speakers = events.speakers
    render locals: {
      events: Event.recent.decorate,
      speakers: Speaker.decorate,
      rooms: Room.all,
      sessions: Session.decorate      
    }
  end
  
  def sessions
  end
  
  protected
  
  def find_event_by_slug
    @event = Event.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = "Record could not be found! Please try on a real page. Mouahahahah"
    redirect_to root_path
  end

end