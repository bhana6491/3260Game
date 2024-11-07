require_relative 'TestBoard'
require_relative "Intersection"
require_relative "Piece"
require_relative "MoveColor"

def print_board(board)
  board.intersection_array.each do |intersection|
    piece = intersection.piece
    piece_color = piece.colour ? piece.colour.to_s : "empty"
    puts "Location: #{intersection.location}, Piece: #{piece_color}"
  end
end

# Create a new board
board = TestBoard.new

# Print the current state of the board
print_board(board)

board_layout = [
  ["A     X-------------W-------------B"],
]
