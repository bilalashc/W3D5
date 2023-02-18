require_relative "tree_node.rb"

class KnightPathFinder

    def self.valid_moves(position)
        
    end
    
    
    
    def initialize(move_tree)
        @move_tree = [move_tree]
    end 

    def find_path(position)
        @move_tree << position
    end

    def new_move_positions(position)

    end

    possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 

    valid_moves = (0...possible_moves.length).each do |x|
                    (0...possible_moves.length).each do |y|
                        possible_moves[x][y] + [4,5][y]
                    end
                end




end 
