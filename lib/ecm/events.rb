module Ecm
  module Events
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::EventHelper)
      end  
    end
  end  
end
