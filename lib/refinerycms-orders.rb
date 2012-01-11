require 'refinerycms-base'

module Refinery
  module Orders

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "orders"
          plugin.pathname = root
          plugin.activity = {
            :class => Order,
            :title => 'order_number'
          }
          # plugin.hide_from_menu = true 
        end
      end
    end
  end
end

require File.expand_path('../refinerycms-order_items', __FILE__)