class MoveExecutor
  attr_accessor :player_state, :Move_colour, :From_coordinate, :To_coordinate, :Board

  def initialize(board, player_state_module)
    @Board = board
    @player_state_module = player_state_module
  end

  def processMove(from_coordinate, to_coordinate)
    game_state = askForState

    @From_coordinate = from_coordinate
    @To_coordinate = to_coordinate
    @player_state = game_state[:phase]
    @Move_colour = game_state[:color]

    valid = isPlayerMoveValid(@From_coordinate, @To_coordinate, @player_state, @player_state[:color])

    if valid
      makeMove(from_coordinate, to_coordinate, @player_state)
    else
      puts "Invalid move" 
    end
  end
  
  def makeMove(from_coordinate, to_coordinate, player_state)
    board.ManipulateBoard(@player_state[:color], @player_state[:phase], from_coordinate, to_coordinate)
  end

  def isPlayerMoveValid(from_coordinate, to_coordinate, player_state, move_colour)
    # The method retrieves the move subset array from the board instance variable
    valid_moves = board.CalculatePossibleMoves(@From_coordinate)

    # The method searches the move subset for from_coordinate and to_coordinate as a possible move
    if valid_moves.include?(@To_coordinate)
      return true
    else
      return false
    end
  end
  
  private
  
  def askForState
    @player_state_module.checkState
  end
end

# Change: Initialized it with an instance of the PlayerStateModule so it can ask for state
# Assumption: Called the CalculatePossibleMoves method with one argument, from_coordinate
# Incomplete: processMove puts "Invalid move" if isPlayerMoveValid returns false 
# Incomplete: May need to remove a lot of the instance variables as they are unnecessary 
# Assumption: Changed MakeMove to be private, as it is only called by processMove
# Assumption: changed isPlayerMoveValid to be private, as it is only called by processMove
# Made processMove into a public method that acts as sendCoordinates does in the sequence diagram