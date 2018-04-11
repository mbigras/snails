require 'action_controller/railtie'

class HelloWorld < Rails::Application
  routes.append do
    root to: 'hello#world'
  end

  config.secret_key_base = SecureRandom.hex(30)
  config.eager_load = false
  config.logger = Logger.new(STDOUT)
end

class HelloController < ActionController::Base
  def world
    render plain: "hello world\n"
  end
end

HelloWorld.initialize!

Rack::Handler::WEBrick.run(HelloWorld)
