class PolyTreeNode

    attr_reader :value, :children, :parent

    def initialize(value, children = [], parent = nil )
        @value = value
        @children = []
        @parent = nil
    end

    def parent=(node)
        @parent = node
        node.children << self if node != nil && !node.children.include?(self)
    end

    


end