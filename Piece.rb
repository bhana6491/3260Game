class Piece
    attr_accessor :isMill, :colour
  
    def initialize(colour=nil)
      @isMill = false
      @colour = colour
    end
  end
  