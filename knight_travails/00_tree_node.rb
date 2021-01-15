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
           new_child.parent = self
       end
    end

    def remove_child(old_child)
        raise "Node is not a child" unless @children.include?(old_child)
        old_child.parent = nil
    end

    def dfs(target)
        return self if target == value
        children.each do |child|
            target_node = child.dfs(target)
            return target_node unless target_node == nil
        end
        nil
    end

    def bfs(target)
        return self if target == value
        queue = children.dup
        until queue.empty?
            node = queue.shift
            return node if node.value == target
            queue += node.children
        end
        nil
    end

end