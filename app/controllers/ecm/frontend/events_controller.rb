class Ecm::Frontend::EventsController < Ecm::FrontendController
  def index
    @events = ::Event.in_month(params[:year], params[:month]).all
  end
  
  def show
    @event = ::Event.find(params[:id])
  end  
end
