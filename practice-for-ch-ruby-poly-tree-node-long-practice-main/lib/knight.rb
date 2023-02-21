require_relative "tree_node.rb"

class KnightPathFinder

    attr_reader :considered_positions, :move_tree

    def self.valid_moves((pos))
        possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 

        valid_moves = (0...possible_moves.length).map do |x|
                        (0...possible_moves[x].length).map do |y|
                            possible_moves[x][y] += pos[y] #[4,5]
                        end
                    end
                
        valid_moves.reject { |pos| pos[0] < 0 || pos[1] < 0 }
    end
    
        
    
    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        @move_tree = [starting_position]
        @considered_positions = [starting_position]
    end 

    def find_path(position)
        
    end

    def new_move_positions(position)
        possible_moves = KnightPathFinder.valid_moves(position)
        result = possible_moves.reject do |move|
                    @considered_positions.include?(move)
                 end
        @considered_positions += result
        return result
    end
    # initilizing tree nodes
    # code will end by itself because queue empty
    def build_move_tree
        queue = [@root_node] 
        until queue.empty?
            first = queue.shift
            # new_move_pos => array
            possible_pos = new_move_positions(first.value)
            # initialize all values as poly tree node
            possible_pos.each do |position|
                queue << PolyTreeNode.new(position,first) 
            end
            # assign first as parent to array
        end

    end

  
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

# p valid_pos([1,2])
knight1 = KnightPathFinder.new([0,0])
p knight1.build_move_tree
p knight1.considered_positions















