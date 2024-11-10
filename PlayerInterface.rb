require_relative "MoveColor"
class PlayerInterface
  def AskModelState(player_state_module)
    # Request the gameboard for the current state
    player_state_module.checkState
  end

  def AskPlayerTurn(player_state_module)
    # Request the current player's turn
    player_state_module.currentTurnColor
  end

  def AskIntersections(board)
    # Fetch intersections for board display
    #return a map of coordinate => X,B or W 
    color_map = {}
    board.location_mapping.each do |location, index|
      if board.intersection_array[index].piece
        if board.intersection_array[index].piece.colour == MoveColor::BLACK
          color_map[location] = "B"
        elsif board.intersection_array[index].piece.colour == MoveColor::WHITE
          color_map[location] = "W"
        end 
        
      else
        color_map[location] = "X"
      end
    end
    color_map
  end

  # def DisplayGameBoardState(model_state, player_turn, intersections)
  def DisplayGameBoardState(board, player_state_module)

    model_state = AskModelState(player_state_module)
    player_turn = AskPlayerTurn(player_state_module)
    intersections = AskIntersections(board)



    # make a map of each coordinate and piece 
    board = <<-BOARD
    A    #{intersections["A1"]}-------------#{intersections["A4"]}--------------#{intersections["A7"]}
         |             |              |
         |             |              |
         |             |              |
    B    |   #{intersections["B2"]}---------#{intersections["B4"]}---------#{intersections["B6"]}    |
         |   |         |         |    |
    C    |   |    #{intersections["C3"]}----#{intersections["C4"]}----#{intersections["C5"]}    |    |
         |   |    |         |    |    |
    D    #{intersections["D1"]}---#{intersections["D2"]}----#{intersections["D3"]}         #{intersections["D5"]}----#{intersections["D6"]}----#{intersections["D7"]}
         |   |    |         |    |    |
    E    |   |    #{intersections["E3"]}----#{intersections["E4"]}----#{intersections["E5"]}    |    |
         |   |         |         |    |
    F    |   #{intersections["F2"]}---------#{intersections["F4"]}---------#{intersections["F6"]}    |
         |             |              |
         |             |              |
         |             |              |
    G    #{intersections["G1"]}-------------#{intersections["G4"]}--------------#{intersections["G7"]}

         1    2    3    4    5    6    7
BOARD

    puts board
    # Display board state and player status
    puts "Current Player Phase: #{model_state[:phase]}"
    puts "Current Player Color: #{model_state[:color]}"
  end

  def AskNewMill(board)
    # Ask if a new mill was created
    board.checkForNewMills
  end

  def AskMillColour(board)
    # Ask the gameboard for the color of the new mill
    # Assuming a method or way exists to retrieve this data
   
    # board.mill_color
  end

  def AskRemoveSubset(board, piece)
    # Ask the gameboard for possible removal intersections
    board.getRemovalLocationsForPiece(piece)
  end

  def AskRemoveCoordinate(remove_subset)
    # Ask the player to choose a remove coordinate
    puts "Choose a coordinate to remove from the following options: #{remove_subset.join(', ')}"
    gets.chomp
  end

  def CommitRemovePiece(board, remove_piece_location)
    # Commit the piece removal to the game board
    board.RemovePiece(remove_piece_location)
  end

  def AskMovePiece
    # Ask for the intersection of the piece to move
    puts "Enter the intersection of the piece you want to move:"
    gets.chomp
  end

  def AskPieceMoveSubset(locations_to_move_to_move, board)
    # Request the move subset for a piece from the MoveExecutor
    board.determine_possible_moves(locations_to_move)
  end

  def AskPlayerState(player_state_module)
    # Request the current player state
    player_state_module.checkState
  end

  def DisplayMoveSubset(valid_move_subset, player_state_info)
    # Display available moves and player state information
    puts "Available Moves: #{valid_move_subset.join(', ')}"
    puts "Player State Info: #{player_state_info}"
  end

  def AskMoveDestination(valid_move_subset)
    # Ask player for move destination
    print "Select your move destination from the available options: #{valid_move_subset.join(', ')} - "
    gets.chomp
  end

  def CommitMoveLocation(move_destination, move_executor)
    # Execute the piece move on the game board
    move_executor.makeMove(move_destination)
  end

  def DisplayValidMove
    # Inform the player that their move was successfully made
    puts "Your move was successful!"
  end
end

# Change: Changed signature of DisplayBoardState method signature