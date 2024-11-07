class Intersection
  attr_accessor :location, :piece

  def initialize(location, piece=nil)
    @location = location
    @piece = piece || Piece.new(nil)
  end
end