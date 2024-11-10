class PlayerInterface
  def AskModelState(player_state_module)
    # Request the gameboard for the current state
    state_info = player_state_module.checkState
    state_info
  end

  def AskPlayerTurn(player_state_module)
    # Request the current player's turn
    player_state_module.currentTurnColor
  end

  def AskIntersections(board)
    # Fetch intersections for board display
    board.intersection_array.map { |intersection| "#{intersection.location}: #{intersection.piece&.colour || 'Empty'}" }.join("\n")
  end

  def DisplayGameBoardState(model_state, player_turn, intersections)
    # Display board state and player status
    puts "Current Game State: #{model_state}"
    puts "Player Turn: #{player_turn}"
    puts "Board Intersections:\n#{intersections}"
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
    puts "Select your move destination from the available options: #{valid_move_subset.join(', ')}"
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
