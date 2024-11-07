require_relative "Intersection"
require_relative "Piece"
require_relative "MoveColor"
class Board
    attr_accessor :intersection_array
  
    def initialize
            # Creates a new board with 24 intersections
            @intersection_array = Array.new(24) { Intersection.new }

            # Mapping of location to index in intersection_array
            @location_mapping = {
              "A1" => 0, "A4" => 1, "A7" => 2,
              "B2" => 3, "B4" => 4, "B6" => 5,
              "C3" => 6, "C4" => 7, "C5" => 8,
              "D1" => 9, "D2" => 10, "D3" => 11, "D5" => 12, "D6" => 13, "D7" => 14,
              "E3" => 15, "E4" => 16, "E5" => 17,
              "F2" => 18, "F4" => 19, "F6" => 20,
              "G1" => 21, "G4" => 22, "G7" => 23
            }
            
            # Default positions of pieces on the board
            default_positions = {
              "A1" => Piece(false), "A4" => Piece(false,MoveColor::WHITE ), "A7" => Piece(false,MoveColor::BLACK ),
              "B2" => Piece(false), "B4" => Piece(false,MoveColor::WHITE ), "B6" => Piece.new(nil),
              "C3" => Piece(false), "C4" => Piece(false,MoveColor::BLACK ), "C5" => Piece.new(nil),
              "D1" => Piece(false), "D2" => Piece.new(nil), "D3" => Piece.new(nil),
              "D5" => Piece(false), "D6" => Piece.new(nil), "D7" => Piece.new(nil),
              "E3" => Piece(false), "E4" => Piece.new(nil), "E5" => Piece.new(nil),
              "F2" => Piece(false), "F4" => Piece.new(nil), "F6" => Piece(false,MoveColor::BLACK ),
              "G1" => Piece(false,MoveColor::WHITE ), "G4" => Piece.new(nil), "G7" => Piece.new(nil)
            }
            
            # Place the pieces on the board
            default_positions.each do |location, piece|
              index = @location_mapping[location]
              @intersection_array[index].piece = piece
            end
        
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
    end
  
    def checkForNewMills
      
    end
  
    private
  
    def isMoveValid(startLocation, endLocation)
      # Validate if the move is legal based on rules
    end
  
    def getRemovalLocationsForPiece(piece)
        opponents_color = piece.color == MoveColor::WHITE ? MoveColor::BLACK : MoveColor::WHITE        
        locations = []

        #count total pieces == total milled pieces 
        opponent_pieces = []
        milled_pieces = []
        for intersection in @intersection_array
            if intersection.piece && intersection.piece.color==opponents_color
                opponent_pieces = opponent_pieces + 1 
                if 
            if intersection.piece && intersection.piece.color==opponents_color && !intersection.piece.isMill
                locations << intersection.location
        locations


        
        for intersection in @intersection_array
            if intersection.piece && intersection.piece.color==opponents_color && !intersection.piece.isMill
                locations << intersection.location
        locations
    end
  
    def MovePiece(initial_location, final_location)
        from = @location_mapping[initial_location]
        to = @location_mapping[final_location]
        piece = @intersection_array[from].piece 
        PlacePiece(piece, to)
        @intersection_array[from].piece 
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
  