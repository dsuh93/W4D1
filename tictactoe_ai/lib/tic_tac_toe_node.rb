require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @mark = next_mover_mark
    # @node = TicTacToeNode.new(board, next_mover_mark)
  end

  def next_mover_mark
    @mark
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_array = []
    board.rows.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if board.rows[r][c] == []
          board.dup[r][c] = next_mover_mark
        end
      end
    end

  end
end
