require_relative "Board"
require_relative "PlayerPhase"
require_relative "MoveColor"

# This class is responsible for managing the player's state and phase
class PlayerStateModule
    
    attr_accessor :currentBlackPhase, :currentWhitePhase, :currentTurnColor, :boardInstance
  
    def initialize(board)
      @currentBlackPhase = PlayerPhase::PLACING
      @currentWhitePhase = PlayerPhase::PLACING
      @currentTurnColor = MoveColor::WHITE
      @boardInstance = board # TODO
      @turn = 1
    end
  
    def UpdatePlayerPhase

      @turn = @turn + 1

      # puts "Turn: #{@turn}"

      total_black_pieces = @boardInstance.TotalBlackPieces
      total_white_pieces = @boardInstance.TotalWhitePieces

      if @currentTurnColor == MoveColor::BLACK
        if total_black_pieces <= 3 && @currentBlackPhase == PlayerPhase::MOVING
          changeState(PlayerPhase::FLYING)
        elsif @turn >= 18 && @currentBlackPhase == PlayerPhase::PLACING
          changeState(PlayerPhase::MOVING)
        end
      elsif @currentTurnColor == MoveColor::WHITE
        if total_white_pieces <= 3 && @currentWhitePhase == PlayerPhase::MOVING
          changeState(PlayerPhase::FLYING)
        elsif @turn >= 18 && @currentWhitePhase == PlayerPhase::PLACING
          changeState(PlayerPhase::MOVING)
        end
      end
      if @currentTurnColor==MoveColor::WHITE
        @currentTurnColor = MoveColor::BLACK
      else
        @currentTurnColor = MoveColor::WHITE 
      end
    end
        
  
    def checkState
      # Retrieves and returns current player phase and state
      if @currentTurnColor == MoveColor::BLACK
        { 'phase': @currentBlackPhase, 'color': MoveColor::BLACK }
      else
        { 'phase': @currentWhitePhase, 'color': MoveColor::WHITE }
      end
    end
  
    def changeState(state)
      # Change the player phase or state
      if @currentTurnColor == MoveColor::BLACK
        @currentBlackPhase = state
      else
        @currentWhitePhase = state
      end
    end
  end

  # Change: Added instance variable for turn
  