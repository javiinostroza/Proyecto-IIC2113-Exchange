require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module RepoBase
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/public/*', headers: :any, methods: :get
        resource '*',
          headers: :any,
          expose: ['X-Page', 'X-PageTotal', 'Authorization'],
          methods: [:get, :post, :patch, :put, :delete, :options]
      end
    end

    config.i18n.fallbacks = [:es, :en]
    config.i18n.default_locale = 'es-CL'
    config.assets.paths << Rails.root.join('node_modules')
    config.load_defaults 6.0
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end
end
