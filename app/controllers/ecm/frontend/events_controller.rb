class Ecm::Frontend::EventsController < Ecm::FrontendController
  def index    
    @month = params[:month] ||= Time.now.month
    @year  = params[:year]  ||= Time.now.year
    
    @time = DateTime.new(@year.to_i, @month.to_i).in_time_zone    
    
    @events = ::Event.in_month(@year, @month).all
    
    @days = {}
    (1..Time.days_in_month(@month.to_i, @year.to_i)).each do |day| 
      @days[day] = []
      @events.each do |event|
        
        if event.begin_at >= DateTime.new(@year.to_i, @month.to_i, day).in_time_zone and event.begin_at < DateTime.new(@year.to_i, @month.to_i, day).in_time_zone.end_of_day
          @days[day].push event
        end
      end
    end
    @days.sort
  end
  
  def show
    @event = ::Event.find(params[:id])
  end  
end
