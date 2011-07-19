module Ecm
  module EventHelper
    def formatted_event_date(event)
      output = "#{l event.begin_at, :format => :event}"
      output << " - #{l(event.end_at, :format => :event)}" unless event.end_at.nil?
      output
    end
  end
end 
 
