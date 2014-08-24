module Refinery
  module Faq
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Faq

      engine_name :refinery_faq

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "faq"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.faq_admin_faqs_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/faq/faq'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Faq)
      end
    end
  end
end
