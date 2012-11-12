require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Nihilist

  VERSION = '0.0.1'

  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
  end
end
