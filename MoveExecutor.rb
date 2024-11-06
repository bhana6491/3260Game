class MoveExecutor
    attr_accessor :player_state, :Move_colour, :From_coordinate, :To_coordinate, :Board
  
    def initialize(board)
      @Board = board
    end
  
    def isPlayerMoveValid(from_coordinate, to_coordinate, player_state, move_colour)
      # Validates if the player move is executable
    end
  
    def makeMove(from_coordinate, to_coordinate, player_state)
      # Executes the move if validated
    end
  
    private
  
    def askForState
      # Requests the player state
    end
  
    def processMove
      # Executes the move process
    end
  end
  