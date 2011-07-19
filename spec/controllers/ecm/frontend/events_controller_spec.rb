require 'spec_helper'

module Ecm
  module Frontend
    describe EventsController do
      render_views
      
      describe "GET 'index'" do
        before(:each) do
          Event.all.map(&:destroy)
          Factory(:last_month_event)
          @event = Factory(:event)
          Factory(:next_month_event)

          @events = [@event]
        end
        
        it "should render the correct template" do
          get :index
          response.should render_template('index')
        end
        
        it "should assign the correct events" do
          get :index, :year => Time.new.year, :month => Time.new.month
          assigns(:events).should eq(@events)
        end
      end # describe "GET 'index'"
      
      describe "GET 'show'" do
        before(:each) do
          @event = Factory(:event)
        end
        
        it "should render the correct template" do
          get :show, :id => @event
          response.should render_template('show')
        end
        
        it "should assign the correct event" do
          get :show, :id => @event
          assigns(:event).should eq(@event)
        end        
      end
    end
  end 
end  
