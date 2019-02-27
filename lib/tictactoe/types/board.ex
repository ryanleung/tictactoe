# We can represent a Board as a 3x3 2d array.
# TODO: let's explore how the API will look first before designing the board
#
# iex> board = %Board{}
# iex> new_board_1 = Board.place_x(board, ROW_TOP, COL_LEFT)
# iex> new_board_2 = Board.place_o(new_board_1, ROW_MID, COL_LEFT)
# iex>
defmodule Board do
  defstruct [
    free: MapSet.new([{1,1},{1,2},{1,3},{2,1},{2,2},{2,3},{3,1},{3,2},{3,3}]),
    x: MapSet.new(),
    o: MapSet.new(),
  ]

  @spec move(Board, {integer, integer}, atom) :: Board
  def move(board, field, player) do
    %{board |
      :free => MapSet.delete(board.free, field),
      player => MapSet.put(Map.get(board, player), field)
    }
  end
end
