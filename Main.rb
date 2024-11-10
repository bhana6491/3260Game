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

player_interface.DisplayGameBoardState(board, player_state_module)

board.ManipulateBoard(MoveColor::WHITE, PlayerState::PLACING, "A1", "A1") 
player_interface.DisplayGameBoardState(board, player_state_module)

board.ManipulateBoard(MoveColor::WHITE, PlayerState::MOVING, "A1", "A7") 
player_interface.DisplayGameBoardState(board, player_state_module)

input = player_interface.AskMoveDestination

# Game loop would follow sequence diagrams and overall flow
# loop do
#   #print
  
# end
