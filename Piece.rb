class Piece
  attr_accessor :colour, :mill_memberships
  
  def initialize(colour)
    @colour = colour
    @mill_memberships = [] # Array to store mill IDs
  end

  def isMill
    !@mill_memberships.empty?
  end
end