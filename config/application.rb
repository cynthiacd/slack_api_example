require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SlackApiExample
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :minitest, spec: true
    end

    # Tell Rails to auto load any .rb files
    # it finds int the 'lib' director
    config.autoload_paths << Rails.root.join("lib")
  end
end
