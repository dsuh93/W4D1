require_relative "./ptn.rb"

class KnightPathFinder
    def self.valid_moves(pos)
        valid_moves = []
        r, c = pos
        return nil if r > 7 || r < 0 || c > 7 || c < 0
        valid_moves << [r + 2, c + 1] unless (r + 2) > 7 || (c + 1) > 7
        valid_moves << [r + 2, c - 1] unless (r + 2) > 7 || (c - 1) < 0
        valid_moves << [r - 2, c + 1] unless (r - 2) < 0 || (c + 1) > 7
        valid_moves << [r - 2, c - 1] unless (r - 2) < 0 || (c - 1) < 0
        valid_moves << [r + 1, c + 2] unless (r + 1) > 7 || (c + 2) > 7
        valid_moves << [r + 1, c - 2] unless (r + 1) > 7 || (c - 2) < 0
        valid_moves << [r - 1, c + 2] unless (r - 1) < 0 || (c + 2) > 7
        valid_moves << [r - 1, c - 2] unless (r - 1) < 0 || (c - 2) < 0
        return valid_moves
    end


    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [starting_position]
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_positions = valid_moves.reject! {|pos| @considered_positions.include?(pos)}
        @considered_positions += new_positions
        new_positions
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            el = queue.shift
            new_move_positions(el.value).each {|pos| el.add_child(pos)}
            el.children.each {|child| queue << child}
        end
        return @root_node 
    end

    def find_path(end_pos)
		if self.build_move_tree.dfs(end_pos) == end_pos
			self.trace_path_back(end_pos)
		else
			raise "End position doesn't exist"
		end
    end

    def trace_path_back(end_pos)
		traced_path = [end_pos]
		until traced_path[0] == @root_node.value
			if end_pos.parent != nil
				traced_path.unshift(end_pos.parent)
				end_pos = end_pos.parent
			end	
		end
		return traced_path
	end
end

knight = KnightPathFinder.new([4, 4])