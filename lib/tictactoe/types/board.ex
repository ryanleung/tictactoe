# We can represent a Board as a 3x3 2d array.
# TODO: let's explore how the API will look first before designing the board
#
# iex> board = %Board{}
# iex> board_1, result = Board.move(board, {1,1}, :x)
# iex> board_2, result = Board.move(board_1, {2,2}, :y)
# iex>
defmodule Board do
  @type row :: integer
  @type col :: integer

  defstruct [
    free: MapSet.new([{1,1},{1,2},{1,3},{2,1},{2,2},{2,3},{3,1},{3,2},{3,3}]),
    x: MapSet.new(),
    o: MapSet.new(),
  ]

  @spec move(Board, row, col, atom) :: {Board, boolean()}
  def move(board, row, col, player) do
    %{board |
      :free => MapSet.delete(board.free, {row, col}),
      player => MapSet.put(Map.get(board, player), {row, col})
    }
  end

  @spec get_result(Board) :: {boolean(), atom}
  def get_result(board) do
    # UNDEFINED
  end
end
