require_relative "tree_node.rb"
require 'byebug'

class KnightPathFinder

    attr_reader :considered_positions, :move_tree

def self.valid_moves(pos)
    possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 

    valid_moves = (0...possible_moves.length).map do |x|
                    (0...possible_moves[x].length).map do |y|
                        possible_moves[x][y] += pos[y] #[4,5]
                    end
                end
            
        valid_moves.reject { |pos| pos[0] < 0 || pos[1] < 0 || pos[0] >= 8 || pos[1] >= 8 }
end

    # def self.valid_moves(pos)
    #     possible_moves = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]] 
    #     x = pos[0]
    #     y = pos[-1]
    #     valid_moves = possible_moves.map do |(dx,dy)|
    #         # [dx + x, dy + y]
    #     end 

    #                 #     (0...possible_moves[x].length).map do |y|
    #                 #         possible_moves[x][y] += pos[y] #[4,5]
    #                 #     end
    #                 # end
    #                 # puts valid_moves
    #     valid_moves.reject { |pos| pos[0] < 0 || pos[1] < 0 || pos[0] >= 8 || pos[1] >= 8 }
    # end
        
    
    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        @move_tree = [starting_position]
        @considered_positions = [starting_position]
    end 

    # def find_path(position)
        
    # end

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
            # debugger
            first = queue.shift
            # new_move_pos => array
            possible_pos = new_move_positions(first.value)
            # initialize all values as poly tree node
            possible_pos.each do |position|
                new_node = PolyTreeNode.new(position,first) 
                new_node.parent = first
                queue << new_node
                 # assign first as parent to array
            end
        end
    end

    def find_path(end_pos)
        return @root_node.value if end_pos == @root_node.value
        @root_node.children.each do |child|
            result = child.dfs(end_pos)
            return result unless result.nil?
        end
        nil
    end
    
    def trace_path_back(end_pos)
        last = find_path(end_pos) #7,7 #next iteratio
        result = [last.value] #7,7
        until last.parent.nil? #iterating until we get to nil #next iteration is 5,6's parent 
            output = last.parent  #5,6
            result << output.value #5,6
            last = output #5,6 
        end 
        result.reverse
    end 
end 



    # def map_to_value(array)
    #     array.map do |ele|
    #        ele.value 
    #     end
    # end 

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
p knight1.considered_positions.length
p knight1.trace_path_back([7,7])

# p KnightPathFinder.valid_moves([5,5])
# p KnightPathFinder.valid_moves([4,4])
# p KnightPathFinder.valid_moves([1,1])














