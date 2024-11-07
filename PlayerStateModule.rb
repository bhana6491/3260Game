require_relative "Board"
require_relative "PlayerPhase"
require_relative "MoveColor"
class PlayerStateModule
    
    attr_accessor :currentBlackPhase, :currentWhitePhase, :currentTurnColor, :boardInstance
  
    def initialize()
      @currentBlackPhase = PlayerPhase::PLACING
      @currentWhitePhase = PlayerPhase::PLACING
      @currentTurnColor = MoveColor::WHITE
      @boardInstance = Board # TODO
    end
  
    def UpdatePlayerPhase
      # Update player phase based on number of pieces on board
    end
  
    def checkState
      # Retrieves and returns current player phase and state
    end
  
    def changeState(state)
      # Change the player phase or state
    end
  end
  