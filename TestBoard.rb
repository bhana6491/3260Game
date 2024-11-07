class TestBoard
  attr_accessor :intersection_array
  attr_reader :location_mapping

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

    # Creates a new board with 24 intersections
    @intersection_array = Array.new(24) { |index| Intersection.new(@location_mapping.key(index)) }
  end

  def TotalWhitePieces
    @intersection_array.count { |intersection| intersection.piece&.colour == MoveColor::WHITE }
  end

  def TotalBlackPieces
    @intersection_array.count { |intersection| intersection.piece&.colour == MoveColor::BLACK }
  end
end
