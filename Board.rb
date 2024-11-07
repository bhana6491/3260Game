require_relative "Intersection"
require_relative "Piece"
require_relative "MoveColor"
class Board
    attr_accessor :intersection_array
  
    def initialize
      @location_mapping = {
        "A1" => 0, "A4" => 1, "A7" => 2,
        "B2" => 3, "B4" => 4, "B6" => 5,
        "C3" => 6, "C4" => 7, "C5" => 8,
        "D1" => 9, "D2" => 10, "D3" => 11, "D5" => 12, "D6" => 13, "D7" => 14,
        "E3" => 15, "E4" => 16, "E5" => 17,
        "F2" => 18, "F4" => 19, "F6" => 20,
        "G1" => 21, "G4" => 22, "G7" => 23
      }

      #Some mechanism to figure out adjacent nodes

  
      # Creates a new board with 24 intersections
      #Only reason intersections array 
      @intersection_array = Array.new(24) { |index| Intersection.new(@location_mapping.key(index)) }
          

    end 
  
    def TotalWhitePieces
      @intersection_array.count { |intersection| intersection.piece&.colour == MoveColor::WHITE }
    end
  
    def TotalBlackPieces
      @intersection_array.count { |intersection| intersection.piece&.colour == MoveColor::BLACK }
    end
    
    # colour: :WHITE or :BLACK
    # player_state: :PLACING, :MOVING, :FLYING
    # from_location: String (?)
    # to_location: String (?)
    def ManipulateBoard(colour, player_state, from_location, to_location)
      # Implementation based on provided algorithm

      # from_intersection = @intersection_array[from_location]
      # to_intersection = @intersection_array[to_location]
  
      # if !from_intersection.isMill && !to_intersection.isMill
      #   case player_state
      #   when :PLACING
      #     to_intersection.piece = Piece.new(colour)
      #   when :REMOVING
      #     if can_remove_piece?(from_intersection)
      #       from_intersection.piece = nil
      #     end
      #   when :MOVING
      #     to_intersection.piece = from_intersection.piece
      #     from_intersection.piece = nil
      #   end
      # end
    end
  
    def CalculatePossibleMoves(locations_to_move, intersection_array)
      # Calculates all possible moves based on the board state
      #Empty array of locations
      #Fri 
    end
  
    def checkForNewMills
      
    end
  
    private
  
    def isMoveValid(startLocation, endLocation)
      if !@location_mapping[endLocation].piece && 
    end
  
    def getRemovalLocationsForPiece(piece)
        opponents_color = piece.color == MoveColor::WHITE ? MoveColor::BLACK : MoveColor::WHITE        
        locations = []

        opponent_pieces = piece.color == MoveColor::WHITE ? TotalBlackPieces : TotalWhitePieces                
        for intersection in @intersection_array
            if intersection.piece && intersection.piece.color==opponents_color 
                if intersection.piece.isMill && opponent_pieces <= 3 # Can steal it because this is last mill
                    locations << intersection.location
                elsif !intersection.piece.isMill
                    locations << intersection.location 
        locations
    end
  
    def MovePiece(initial_location, final_location)
        from = @location_mapping[initial_location]
        to = @location_mapping[final_location]
        piece = @intersection_array[from].piece 
        PlacePiece(piece, to)
        RemovePiece(from)
    end
  
    def CopyPiece(location)
        index = @location_mapping[location]
        @intersection_array[index].piece 
    end
  
    def RemovePiece(location)
        index = @location_mapping[location]
        @intersection_array[index].piece = nil 
    end
  
    def PlacePiece(piece, location)
        index = @location_mapping[location]
        @intersection_array[index].piece = piece 
    end
  end
  