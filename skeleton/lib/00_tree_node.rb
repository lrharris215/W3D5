require "byebug"

class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def value
        @value
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def parent=(new_parent)
        @parent.children.delete(self) unless parent == nil
        @parent = new_parent
        unless @parent == nil || @parent.children.include?(self)
            @parent.children << self 
        end
    end

    def add_child(new_child)
       unless @children.include?(new_child)
            @children << new_child 
            new_child.parent = self
       end
    end

    def remove_child(old_child)
        children.delete(old_child)
    end

end