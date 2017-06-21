class Rack
  attr_reader :servers

  def initialize
    @servers = []
  end
end

class Server
  attr_accessor :rack
  attr_reader :cards
  attr_accessor :location
  alias_method :name, :location

  def initialize
    @cards = []
  end
end

class Card
  attr_accessor :server
end
