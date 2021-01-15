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
        old_parent = @parent
        @parent = new_parent
        unless @parent == nil
            @parent.add_child(self) 
        end
        old_parent.remove_child(self) unless old_parent == nil
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