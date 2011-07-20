class Ecm::Frontend::EventsController < Ecm::FrontendController
  def index    
    @month = (params[:month] ||= Time.now.month).to_i
    @year  = (params[:year]  ||= Time.now.year).to_i
    
    # @time = DateTime.new(@year.to_i, @month.to_i).beginning_of_day.in_time_zone
    @time = DateTime.new(@year, @month).in_time_zone.beginning_of_day
    
    @events = ::Event.in_month(@year, @month).all
    
    @days = {}
    (1..Time.days_in_month(@month, @year)).each do |day| 
      @days[day] = []
      @events.each do |event|
        if event.begin_at_day(DateTime.new(@year, @month, day))
        # if event.begin_at >= DateTime.new(@year, @month, day).in_time_zone.beginning_of_day and event.begin_at < DateTime.new(@year, @month, day).in_time_zone.end_of_day
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
