require_relative 'Board'
require_relative 'Intersection'
require_relative 'Piece'
require_relative 'PlayerInterface'
require_relative 'PlayerStateModule'
require_relative 'MoveExecutor'
require_relative 'MoveCalculator'

# Initialize game components
board = Board.new
player_state_module = PlayerStateModule.new(board)
move_executor = MoveExecutor.new(board, player_state_module)
move_calculator = MoveCalculator.new
player_interface = PlayerInterface.new()

# player_interface.DisplayGameBoardState(board, player_state_module)
# board.ManipulateBoard(MoveColor::WHITE, PlayerState::PLACING, "A1", "A1") 
# player_interface.DisplayGameBoardState(board, player_state_module)
# board.ManipulateBoard(MoveColor::WHITE, PlayerState::MOVING, "A1", "A7") 
# player_interface.DisplayGameBoardState(board, player_state_module)
# coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, PlayerState::PLACING,MoveColor::WHITE))
# board.ManipulateBoard(MoveColor::WHITE, PlayerState::PLACING, coordinate, coordinate)
# player_interface.DisplayGameBoardState(board, player_state_module)

# attr_accessor :currentBlackPhase, :currentWhitePhase, :currentTurnColor, :boardInstance

# CalculatePossibleMoves(from_location, player_state, colour)

loop do
    player_interface.DisplayGameBoardState(board, player_state_module)
#     # IN THE PLACING PHASE 
    # depending on turn, get player phase from player state 
        if player_state_module.currentTurnColor == MoveColor::BLACK
        coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, player_state_module.currentBlackPhase, MoveColor::BLACK))
        move_executor.processMove()
        board.ManipulateBoard(MoveColor::BLACK, player_state_module.currentBlackPhase, coordinate, coordinate)
        player_interface.DisplayGameBoardState(board, player_state_module)

    elsif player_state_module.currentTurnColor == MoveColor::WHITE
        coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, player_state_module.currentWhitePhase, MoveColor::BLACK))
        board.ManipulateBoard(MoveColor::WHITE, player_state_module.currentWhitePhase, coordinate, coordinate)
        player_interface.DisplayGameBoardState(board, player_state_module)
    end

    player_state_module.UpdatePlayerPhase
    
    # player_interface.DisplayGameBoardState(board, player_state_module)
    # coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, PlayerState::PLACING,MoveColor::BLACK))
    # board.ManipulateBoard(MoveColor::BLACK, PlayerState::PLACING, coordinate, coordinate)
end 

# player_interface.DisplayGameBoardState(board, player_state_module)

# Game loop would follow sequence diagrams and overall flow

# PLACING LOOP

# loop do
 #Print Board 
 #Turn Counter => Ends at 9 
    #Everyones placing(stealing can happen)
    
    # board.CalculatePossibleMoves() # Strictly for moving 
    # move_executor.processMove(from_coordinate, to_coordinate)

 #Players place all the relevant pieces (repeats until )
    # White player
    # Black player

    #
    # 


 
#win condition is 0 moves or 2 
  
# end
