class ActivitiesController < ApplicationController
    
  def index
    render locals: {
      events: Event.recent.decorate,
      speakers: Speaker.decorate,
      rooms: Room.all,
      sessions: Session.decorate      
    }
  end
  def show
    #@session = @session.event
    event = Event.find_by(slug: params[:id])
  end
end