require "00_tree_node"

class KnightPathFinder

    def initialize(pos)
        @starting_pos = pos
        @root = PolyTreeNode.new(pos)
        build_move_tree

        @considered_positions = [pos]


    end


    def valid_position(pos)
        row, col = pos
        row.between?(0, 7) && col.between?(0, 7)
    end

    def valid_moves(pos)
    
    end

    def build_move_tree

    end

end