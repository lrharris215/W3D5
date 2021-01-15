require "./00_tree_node"

class KnightPathFinder

    def initialize(pos)
        raise "Not a valid position" unless KnightPathFinder.valid_position(pos)
        @starting_pos = pos
        @root = PolyTreeNode.new(pos)
    
        @considered_positions = [pos]
        build_move_tree
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

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_moves = []
        valid_moves.each do |pos|
            unless @considered_positions.include?(pos)
                @considered_positions << pos 
                new_moves << pos
            end
        end
        new_moves
    end

    def build_move_tree
        queue = [@root]
        until queue.empty?
            node = queue.shift
            moves = new_move_positions(node.value)
            moves.each do |pos| 
                n = PolyTreeNode.new(pos)
                n.parent = node
                queue << n
            end 
        end
    end

end