class Farm
  attr_reader :racks
  attr_reader :rows, :cols

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @racks = {}
  end

  def add_rack(rack, row, col)
    rack.row = row
    rack.col = col
    @racks[rack.location] = rack
    rack
  end
end

class Rack
  attr_accessor :farm
  attr_accessor :row, :col
  attr_reader :servers
  SHELVES = 2

  def initialize
    @servers = Array(SHELVES)
  end

  def location
    @location ||= "#{row}:#{col}"
  end

  def add_server(server, idx)
    @servers[idx] = server
    server.rack = self
    server
  end
end

class Server
  attr_accessor :rack
  attr_reader :cards

  SLOTS = 11

  def initialize
    @cards = Array(SLOTS)
  end

  def add_card(card, slot)
    @cards[slot] = card
    card.server = self
    card
  end
end

class Card
  attr_accessor :server
end

farm = Farm.new(5, 4)

farm.rows.times do |row|
  farm.cols.times do |col|

    rack = Rack.new
    farm.add_rack(rack, row, col)

    Rack::SHELVES.times do |shelf|
      server = Server.new
      rack.add_server server, shelf

      Server::SLOTS.times do |slot|
        card = Card.new
        server.add_card(card, slot)
      end
    end

  end
end
