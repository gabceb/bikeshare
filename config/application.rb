require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'active_record/connection_adapters/postgis_adapter/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Bikeshare

  class ActiveRecordOverrideRailtie < Rails::Railtie
    initializer "active_record.initialize_database.override" do |app|

      ActiveSupport.on_load(:active_record) do
        if url = ENV['DATABASE_URL']
          ActiveRecord::Base.connection_pool.disconnect!
          parsed_url = URI.parse(url)
          config =  {
            adapter:             'postgis',
            host:                parsed_url.host,
            encoding:            'unicode',
            database:            parsed_url.path.split("/")[-1],
            port:                parsed_url.port,
            username:            parsed_url.user,
            password:            parsed_url.password
          }
          establish_connection(config)
        end
      end
    end
  end

  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
