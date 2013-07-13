module DispatchJs
  module Rails
    class Engine < ::Rails::Engine
      initializer 'my_engine.action_controller' do |app|
        ActiveSupport.on_load :action_controller do
          helper DispatchJs::LayoutHelper
        end
      end
    end
  end
  
  module LayoutHelper
    def dispatch
      "data-controller=\"#{params[:controller]}\" data-action=\"#{params[:action]}\"".html_safe
    end
  end
end
