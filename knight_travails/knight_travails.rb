require "./00_tree_node"

class KnightPathFinder

    def initialize(pos)
        @starting_pos = pos
        @root = PolyTreeNode.new(pos)
        build_move_tree

        @considered_positions = [pos]


    end


    def self.valid_position(pos)
        row, col = pos
        row.between?(0, 7) && col.between?(0, 7)
    end

    def self.valid_moves(pos)
        row, col = pos
        valid_moves = []
        (1..2).each do |offset_1|
            (1..2).each do |offset_2|
                next if offset_1 == offset_2
                new_pos = [row + offset_1, col + offset_2]
                valid_moves << new_pos if KnightPathFinder.valid_position(new_pos)
                new_pos = [row + offset_1, col - offset_2]
                valid_moves << new_pos if KnightPathFinder.valid_position(new_pos)
                new_pos = [row - offset_1, col + offset_2]
                valid_moves << new_pos if KnightPathFinder.valid_position(new_pos)
                new_pos = [row - offset_1, col - offset_2]
                valid_moves << new_pos if KnightPathFinder.valid_position(new_pos)
            end
        end
        valid_moves
    end

    def build_move_tree

    end

end