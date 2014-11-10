require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      # TODO: Fix this "hack" for handling favicon
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []] 
      elsif env["PATH_INFO"] == "/"
        path = File.expand_path("../../public/root.html", __FILE__)
        html = File.read(path)
        return [200, {"Content-Type" => "text/html"}, [html]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue
        return [500, {"Content-Type" => "text/html"}, ["Oops, something went wrong!!"]]
      end
      [200, {"Content-Type" => "text/html"}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
