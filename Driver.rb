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
        if player_state_module.currentBlackPhase == PlayerPhase::PLACING

            coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, player_state_module.currentBlackPhase, MoveColor::BLACK))
            if move_executor.processMove(coordinate, coordinate)
                if player_interface.AskNewMill(board)
                    player_state_module.changeState(PlayerState::REMOVE)

                    
                    possible_moves = board.CalculatePossibleMoves(nil, player_state_module.currentBlackPhase, MoveColor::BLACK)
                    coordinate = nil

                    while coordinate.nil? || !possible_moves.include?(coordinate)
                        coordinate = player_interface.AskRemoveCoordinate(possible_moves)
                        if !possible_moves.include?(coordinate)
                            puts "Invalid coordinate. Please choose from: #{possible_moves.join(', ')}"
                        end
                    end 
                    board.RemovePiece(coordinate)
                    player_state_module.changeState(PlayerState::PLACING)
                   
                end
                player_state_module.UpdatePlayerPhase 
            end 
        else
            from_coordinate = player_interface.AskMovePiece
            to_coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(from_coordinate, player_state_module.currentBlackPhase, MoveColor::BLACK))
            if move_executor.processMove(from_coordinate, to_coordinate)
                if player_interface.AskNewMill(board)
                    player_state_module.changeState(PlayerState::REMOVE)

                    
                    possible_moves = board.CalculatePossibleMoves(nil, player_state_module.currentBlackPhase, MoveColor::BLACK)
                    coordinate = nil

                    while coordinate.nil? || !possible_moves.include?(coordinate)
                        coordinate = player_interface.AskRemoveCoordinate(possible_moves)
                        if !possible_moves.include?(coordinate)
                            puts "Invalid coordinate. Please choose from: #{possible_moves.join(', ')}"
                        end
                    end 
                    board.RemovePiece(coordinate)
                    player_state_module.changeState(PlayerState::MOVING)
                end
                player_state_module.UpdatePlayerPhase 
            end 
        end             

    elsif player_state_module.currentTurnColor == MoveColor::WHITE
        if player_state_module.currentWhitePhase == PlayerPhase::PLACING
            coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, player_state_module.currentWhitePhase, MoveColor::WHITE))
            if move_executor.processMove(coordinate, coordinate)
                if player_interface.AskNewMill(board)
                    player_state_module.changeState(PlayerState::REMOVE)

                    
                    possible_moves = board.CalculatePossibleMoves(nil, player_state_module.currentWhitePhase, MoveColor::WHITE)
                    coordinate = nil

                    while coordinate.nil? || !possible_moves.include?(coordinate)
                        coordinate = player_interface.AskRemoveCoordinate(possible_moves)
                        if !possible_moves.include?(coordinate)
                            puts "Invalid coordinate. Please choose from: #{possible_moves.join(', ')}"
                        end
                    end 
                    board.RemovePiece(coordinate)
                    player_state_module.changeState(PlayerState::PLACING)
                   
                end
                player_state_module.UpdatePlayerPhase 
            end
        else
            from_coordinate = player_interface.AskMovePiece
            to_coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(from_coordinate, player_state_module.currentWhitePhase, MoveColor::WHITE))
            if move_executor.processMove(from_coordinate, to_coordinate)
                if player_interface.AskNewMill(board)
                    player_state_module.changeState(PlayerState::REMOVE)

                    
                    possible_moves = board.CalculatePossibleMoves(nil, player_state_module.currentWhitePhase, MoveColor::WHITE)
                    coordinate = nil

                    while coordinate.nil? || !possible_moves.include?(coordinate)
                        coordinate = player_interface.AskRemoveCoordinate(possible_moves)
                        if !possible_moves.include?(coordinate)
                            puts "Invalid coordinate. Please choose from: #{possible_moves.join(', ')}"
                        end
                    end 
                    board.RemovePiece(coordinate)
                    player_state_module.changeState(PlayerState::MOVING)
                   
                end
                player_state_module.UpdatePlayerPhase 
            end 
        end

    end
    

    # if player_state_module.currentTurnColor == MoveColor::BLACK

    #     if player_state_module.currentBlackPhase == PlayerPhase::PLACING
    #         coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, player_state_module.currentBlackPhase, MoveColor::BLACK))
    #         board.ManipulateBoard(MoveColor::BLACK, player_state_module.currentBlackPhase, coordinate, coordinate)
    #         player_interface.DisplayGameBoardState(board, player_state_module)
    #     else
    #         from_coordinate = player_interface.AskMovePiece
    #         puts "From Coordinate: #{from_coordinate}"
    #         to_coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(from_coordinate, player_state_module.currentBlackPhase, MoveColor::BLACK))
    #         board.ManipulateBoard(MoveColor::BLACK, player_state_module.currentBlackPhase, from_coordinate, to_coordinate)
    #         player_interface.DisplayGameBoardState(board, player_state_module)
    #     end

    # elsif player_state_module.currentTurnColor == MoveColor::WHITE
    #     if player_state_module.currentWhitePhase == PlayerPhase::PLACING
    #         coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(nil, player_state_module.currentWhitePhase, MoveColor::WHITE))
    #         board.ManipulateBoard(MoveColor::WHITE, player_state_module.currentBlackPhase, coordinate, coordinate)
    #         player_interface.DisplayGameBoardState(board, player_state_module)
    #     else
    #         from_coordinate = player_interface.AskMovePiece
    #         to_coordinate = player_interface.AskMoveDestination(board.CalculatePossibleMoves(from_coordinate, player_state_module.currentWhitePhase, MoveColor::WHITE))
    #         board.ManipulateBoard(MoveColor::WHITE, player_state_module.currentWhitePhase, from_coordinate, to_coordinate)
    #         player_interface.DisplayGameBoardState(board, player_state_module)
    #     end
    # end

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
