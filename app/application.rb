require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      binding.pry
      if Item.all.include?(item_name)
      end

      resp.write "You requested the songs"
      #env["PATH_INFO"]
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
