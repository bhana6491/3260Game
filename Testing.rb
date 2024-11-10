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
  ["A     X--------------X--------------X"],
  ["      |\\             |             /|"],
  ["      | \\            |            / |"],
  ["      |  \\           |           /  |"],
  ["B     |    X---------X---------X----|"],
  ["      |    | \\       |       / |    |"],
  ["C     |    |    X----X----X    |    |"],
  ["      |    |    |         |    |    |"],
  ["D     X----X----X         X----X----X"],
  ["      |    |    |         |    |    |"],
  ["E     |    |    X----X----X    |    |"],
  ["      |    | /       |       \\ |    |"],
  ["F     |    X---------X---------X----|"],
  ["      |  /           |           \\  |"],
  ["      | /            |            \\ |"],
  ["      |/             |             \\|"],
  ["G     W--------------X--------------X"],
  ["                                     "],
  ["                                     "],
  ["                                     "],
  ["      1    2    3    4    5    6    7"],
  ["X - Empty Intersection               "],
  ["B - Black Piece                      "],        
  ["W - White Piece                      "]            
]

def print_board_layout(board_layout)
  board_layout.each do |row|
    puts row
  end
end

location_mapping = {
  "A1" => [0, 6], "A4" => [0, 21], "A7" => [0, 36],
  "B2" => [4, 10], "B4" => [4, 20], "B6" => [4, 30],
  "C3" => [6, 10], "C4" => [6, 15], "C5" => [6, 20],
  "D1" => [8, 0], "D2" => [8, 5], "D3" => [8, 10], 
  "D5" => [8, 20], "D6" => [8, 25], "D7" => [8, 30],
  "E3" => [10, 10], "E4" => [10, 15], "E5" => [10, 20],
  "F2" => [12, 10], "F4" => [12, 20], "F6" => [12, 30],
  "G1" => [16, 6], "G4" => [16, 21], "G7" => [16, 36]
}

row, col = location_mapping["A1"]
# board_layout[row][0][col] = 'B'
print_board_layout(board_layout)
