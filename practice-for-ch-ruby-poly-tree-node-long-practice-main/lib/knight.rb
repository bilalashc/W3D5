require_relative "tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 

        valid_moves = (0...possible_moves.length).map do |x|
                        (0...possible_moves[x].length).map do |y|
                            possible_moves[x][y] += pos[y] #[4,5]
                        end
                    end
                
        valid_moves.reject { |pos| pos[0] < 0 || pos[1] < 0 }
    end
    
    
    
    def initialize(starting_position)
        @move_tree = [starting_position]
        @considered_positions = [starting_position]
    end 

    def find_path(position)
        @move_tree << position
    end

    def new_move_positions(position)
        KnightPathFinder.valid_moves(last_position).include?(position) && !@considered_positions.include?(position)
    end

    # possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 

    # valid_moves = (0...possible_moves.length).each do |x|
    #                 (0...possible_moves[x].length).each do |y|
    #                     possible_moves[x][y] + [4,5][y]
    #                 end
    #             end




end 

# def valid_pos(pos)
#     possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 

#     valid_moves = (0...possible_moves.length).map do |x|
#                     (0...possible_moves[x].length).map do |y|
#                         possible_moves[x][y] += pos[y] #[4,5]
#                     end
#                 end
            
#     valid_moves.reject { |pos| pos[0] < 0 || pos[1] < 0 }
# end

# p valid_pos([0,0])
