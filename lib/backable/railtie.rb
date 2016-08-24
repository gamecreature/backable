module Backable
  class Railtie < Rails::Railtie

    initializer "backable.controller_concerns" do
      ActiveSupport.on_load( :action_controller ){ include Backable::ControllerConcern }
    end

    initializer "backable.view_helpers" do
      ActiveSupport.on_load( :action_view ){ include Backable::ViewHelpers }
    end

  end
end

