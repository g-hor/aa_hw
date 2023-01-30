class GraphNode
  attr_accessor :value, :neighbors

  def initialize(value)
    self.value = value
    self.neighbors = []
  end

  def bfs(start, targ_val)
    q = [start]

    until q.empty? do
      q.each do |node|
        return node.value if node.value == targ_val
        q += node.neighbors
        q.pop
      end
    end

    return nil
  end




end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, 'f')