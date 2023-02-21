class PolyTreeNode

    attr_reader :value, :children, :parent

    # def self.root_node(position)
    #     @kpf = KnightPathFinder.new(position)
    # end

    def initialize(value, parent = nil, children = [])
        @value = value
        @children = []
        @parent = parent
    end

    def parent=(node)
        @parent.children.delete(self) if !@parent.nil?
        @parent = node
        @parent.children << self if node != nil && !node.children.include?(self)
    end

    def add_child(child_node)
        @children << child_node if !children.include?(child_node)
        child_node.parent = self
    end
    
    def remove_child(child_node)
        child_node.parent = nil
        raise "sorry #{child_node} is not our child" if !children.include?(child_node)
        @children.delete(child_node) if children.include?(child_node)
        
    end

    def dfs(target = nil)
        return self if target == self.value
        children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target = nil)

        queue = [self]
        until queue.empty?
            first = queue.shift
            return first if first.value == target
            queue.concat(first.children)
        end

        nil
    end


end