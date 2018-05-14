require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsEcommerce
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.autoload_paths << Rails.root.join('app/subscribers')   
    config.active_record.raise_in_transactional_callbacks = true
  end
end
