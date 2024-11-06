class PlayerStateModule
    attr_accessor :currentBlackPhase, :currentWhitePhase, :currentTurnColor, :boardInstance
  
    def initialize(boardInstance)
      @boardInstance = boardInstance
      @currentBlackPhase = :placing
      @currentWhitePhase = :placing
      @currentTurnColor = :white
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
  