class PlayerInterface
    def AskModelState(player_state_module)
      # Request the gameboard for current state
    end
  
    def AskPlayerTurn(player_state_module)
      # Request the current player's turn
    end
  
    def AskIntersections(board)
      # Fetch intersections for board display
    end
  
    def DisplayGameBoardState(model_state, player_turn, intersections)
      # Display board state and player status
    end
  
    def AskNewMill(board)
      # Ask if a new mill was created
    end
  
    def AskMillColour(board)
      # Ask for the color of the new mill
    end
  
    def AskRemoveSubset(board)
      # Ask for possible removal intersections
    end
  
    def AskRemoveCoordinate(remove_subset)
      # Ask player to choose a remove coordinate
    end
  
    def CommitRemovePiece(move_executor, remove_piece_intersection)
      # Commit the piece removal
    end
  
    def AskMovePiece
      # Ask for the piece to move
    end
  
    def AskPieceMoveSubset(piece_to_move, move_executor)
      # Request move subset for a piece
    end
  
    def AskPlayerState(player_state_module)
      # Request current player state
    end
  
    def DisplayMoveSubset(valid_move_subset, player_state_info)
      # Display available moves and state to player
    end
  
    def AskMoveDestination(valid_move_subset)
      # Ask player for move destination
    end
  
    def CommitMoveLocation(move_destination, move_executor)
      # Execute the piece move on the game board
    end
  
    def DisplayValidMove
      # Inform player of successful move
    end
  end
  