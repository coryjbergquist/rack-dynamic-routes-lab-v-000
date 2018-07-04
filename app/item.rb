class Item
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 binding.pry
    if req.path.match(/items/)
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
