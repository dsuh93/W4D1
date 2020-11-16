class PolyTreeNode
    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value #starting_position
        @children = [] #possible_position_nodes
        @parent = nil  #node 
    end

    def parent=(node) 
        if @parent != nil 
            @parent.children.delete(self)
        end
        @parent = node
        node.children << self if node != nil && !node.children.include?(self)
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        raise "child does not exist" if !self.children.include?(child)
    end

    def dfs(target)
      return self.value if self.value == target
      return nil if self.nil?
      self.children.each do |child|
        search_result = child.dfs(target)
        return search_result unless search_result.nil? 
      end

      nil
    end

    # def dfs_parents(target)
    #   return self.parent.value if self.value == target
    #   return nil if self.parent.nil?
      
    #   i = 0
    #   while i < self.children.length

    #     search_result = self.children[i].dfs_parents(self.parent.value)
    #     return search_result unless search_result.nil? 
    #     i += 1
    #   end

    #   nil
    # end
  
    def bfs(target)
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el.value if el.value == target
            el.children.each {|child| queue << child}
        end
    end
end