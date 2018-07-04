require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      Item.all.map do |item_object|
        if item_object.name != item_name
          resp.write "Item not found"
          resp.status = 400
        else
          resp.write "#{item_object.price}"
          resp.status = 200
        end
      end
    else
      resp.write "Route not found"
      resp.status = 404
      end
    resp.finish
  end

end
