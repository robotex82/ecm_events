 Rails.application.routes.draw do |map|
  resources :events, :controller => 'ecm/frontend/events', :only => [:index, :show] do
    collection do
      get '/:year/:month', :action => :index
    end
    # insert code for :year and :month lookup here
  end
end
