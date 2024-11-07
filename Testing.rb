require_relative 'TestBoard'
require_relative "Intersection"
require_relative "Piece"
require_relative "MoveColor"

def print_board(board)
  board_layout = [
    ["A1", "----", "A4", "----", "A7"],
    ["|", " ", "|", " ", "|"],
    ["|", " ", "|", " ", "|"],
    ["B2", "----", "B4", "----", "B6"],
    ["|", " ", "|", " ", "|"],
    ["|", " ", "|", " ", "|"],
    ["C3", "----", "C4", "----", "C5"],
    ["|", " ", "|", " ", "|"],
    ["|", " ", "|", " ", "|"],
    ["D1", "----", "D2", "----", "D3", " ", "D5", "----", "D6", "----", "D7"],
    ["|", " ", "|", " ", "|"],
    ["|", " ", "|", " ", "|"],
    ["E3", "----", "E4", "----", "E5"],
    ["|", " ", "|", " ", "|"],
    ["|", " ", "|", " ", "|"],
    ["F2", "----", "F4", "----", "F6"],
    ["|", " ", "|", " ", "|"],
    ["|", " ", "|", " ", "|"],
    ["G1", "----", "G4", "----", "G7"]
  ]

  board_layout.each do |row|
    row.each do |cell|
      if cell.match?(/[A-G][1-7]/)
        index = board.location_mapping[cell]
        piece = board.intersection_array[index].piece
        piece_color = piece.colour ? piece.colour.to_s[0] : "X"
        print piece_color
      else
        print cell
      end
    end
    puts
  end
end

# Create a new board
board = TestBoard.new

# Print the current state of the board
print_board(board)