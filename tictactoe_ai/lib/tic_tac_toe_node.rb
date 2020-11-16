require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :prev_move_pos, :next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    # @node = TicTacToeNode.new(board, next_mover_mark)
  end

  def losing_node?(evaluator)
    if next_mover_mark == :x
      if 

    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_array = []

    (0...@board.rows.length).each do |row|
      (0...@board.rows.length).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          duped = @board.dup
          duped[pos] = @next_mover_mark
          children_array << TicTacToeNode.new(duped, self.switch, pos)
        end
      end
    end

    children_array
  end

  def switch
    if @next_mover_mark == :x
      return :o
    else
      return :x
    end
  end
end
