require 'bar'

class Routes
  def append
    yield
  end
end

class SecureRandom
  def self.hex i
    42
  end
end

class Logger
  def initialize o
  end
end

class Config
  attr_accessor :secret_key_base, :eager_load, :logger
end

module Rails
  class Application
    class << self
      def routes
        Routes.new
      end

      def root(h)
      end

      def config
        Config.new
      end

      def initialize!
      end
    end
  end
end

module ActionController
  class Base
  end
end

module Rack
  module Handler
    class WEBrick
      def self.run o
        puts "running #{o}!"        
      end
    end
  end
end
