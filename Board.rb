require_relative "Intersection"
require_relative "Piece"
require_relative "MoveColor"
require_relative "PlayerState"
class Board
    attr_accessor :intersection_array, :location_mapping
  
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

      @mills = [["A1", "D1", "G1"], ["A7", "D7", "G7"], ["G1", "G4", "G7"], ["A1", "A4", "A7"], ["B2", "B4", "B6"], ["F2", "F4", "F6"],["B2", "D2", "F2"], 
    ["B6", "D6", "F6"], ["D1", "D2", "D3"], ["D5", "D6", "D7"], ["C3", "C4", "C5"], ["E3", "E4", "E5"],["C3", "D3", "E3"], ["C5","D5","E5"], ["C4", "B4", "A4"], ["E4", "F4","G4"]]
       

      @adjacency_mapping = {
        "A1" => ["A4", "D1"], 
        "A4" => ["A1", "A3", "B4"], 
        "A7" => ["D7", "A4"], 
        "B2" => ["D2", "B4"], 
        "B4" => ["B2", "B6","C4", "A4"],
        "B6" => ["B4", "D6"], 
        "C3" => ["D3", "C4"], 
        "C4" => ["C3", "C5", "B4"], 
        "D1" => ["G1", "A1", "D2"],
        "D2" => ["D1", "D3", "B2", "F2"],
        "D3" => ["D2", "C3", "E3"],
        "D5" => ["C5", "E5", "D6"],
        "D6" => ["D5", "D7", "B6", "F6"],
        "D7" => ["A7", "G7", "D6"],
        "E3" => ["D3", "E4"],
        "E4" => ["E3", "E5", "F4"],
        "E5" => ["E4", "D5"],
        "F2" => ["D2", "F4"],
        "F4" => ["F2", "F6", "E4", "G4"],
        "F6" => ["D6", "F4"],
        "G1" => ["D1", "G4"],
        "G4" => ["F4", "G1", "G7"],
        "G7" => ["D7", "G4"]
      }
      @intersection_array = Array.new(24) { |index| Intersection.new(@location_mapping.key(index)) }
    end 
  
    def TotalWhitePieces
      @intersection_array.count { |intersection| intersection.piece&.colour == MoveColor::WHITE }
    end
  
    def TotalBlackPieces
      @intersection_array.count { |intersection| intersection.piece&.colour == MoveColor::BLACK }
    end
    
    def ManipulateBoard(colour, player_state, from_location, to_location)      
      if player_state==PlayerState::PLACING
        piece = Piece.new(colour)
        PlacePiece(piece,from_location)
      elsif player_state==PlayerState::REMOVE
        RemovePiece(from_location)
      elsif player_state==PlayerState::MOVING
        MovePiece(from_location, to_location)
      end 
    end
  
    def CalculatePossibleMoves(from_location, player_state, colour)
      possible_moves = []

      if player_state==PlayerState::PLACING || player_state==PlayerState::FLYING
        @location_mapping.each do |location, index|
          if !@intersection_array[index].piece
            possible_moves << location
          end
        end
        
      else
        if player_state==PlayerState::REMOVE
          return getRemovalLocations(colour)
        end
        
        @adjacency_mapping[from_location].each do |end_location|
          if isMoveValid(from_location,end_location , player_state, colour)
              possible_moves << end_location 
          end
        end
      end
      possible_moves
    end
  
    def checkForNewMills
      millCreated = false
      @mills.each_with_index do |mill, mill_id|
        first = @intersection_array[@location_mapping[mill[0]]].piece
        second = @intersection_array[@location_mapping[mill[1]]].piece
        third = @intersection_array[@location_mapping[mill[2]]].piece
    
        next if !first || !second || !third
    
        if first.colour == second.colour && second.colour == third.colour
          unless [first, second, third].all? { |p| p.mill_memberships.include?(mill_id) }
            [first, second, third].each { |p| p.mill_memberships << mill_id unless p.mill_memberships.include?(mill_id) }
            millCreated = true
          end
        else
          [first, second, third].each { |p| p.mill_memberships.delete(mill_id) }
        end
      end
      millCreated
    end
    
    def isMoveValid(startLocation, endLocation, player_state, colour)
      start_idx = @location_mapping[startLocation]
      end_idx = @location_mapping[endLocation]
      if player_state==PlayerState::PLACING
        if @intersection_array[start_idx].piece#Piece can't be present on starting location when placing
          return false
        end 
      else
        if !@intersection_array[start_idx].piece #Piece must be present on starting location when non-placing/moving
          return false
        end 
        if colour!= @intersection_array[start_idx].piece.colour #Piece at intersection has to be player's color 
          return false 
        end 
        
        if player_state==PlayerState::REMOVE && colour==@intersection_array[start_idx].piece.colour#Must be removing opponents piece
          return false 
        end

        if @intersection_array[start_idx].piece.isMill#Can't remove a mill
          return false
        end 
        
        if player_state == PlayerState::MOVING && !@adjacency_mapping[startLocation].include?(endLocation)#Start and end locations must be adjacent
          return false 
        end 
        
        if @intersection_array[end_idx].piece#There is a piece already at the end location
          return false 
        end
      end
      return true 
    end
  
    def getRemovalLocations(colour)
        locations = []
        opponent_pieces = colour == MoveColor::WHITE ? self.TotalBlackPieces : self.TotalWhitePieces
        opponents_color = colour == MoveColor::WHITE ? MoveColor::BLACK : MoveColor::WHITE          
        for intersection in @intersection_array
            if intersection.piece && intersection.piece.colour==opponents_color 
                if intersection.piece.isMill && opponent_pieces <= 3 # Can steal it because this is last mill
                    locations << intersection.location
                elsif !intersection.piece.isMill
                    locations << intersection.location
                end
              end 
            end 
        locations
    end
  
    def MovePiece(initial_location, final_location)
        from = @location_mapping[initial_location]
        piece = @intersection_array[from].piece
        PlacePiece(piece, final_location)
        RemovePiece(initial_location)
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

  