def BFS(root, target)
  # create queue - array
  # add the root node to queue -  [a]
  # loops through the queue until empty
    # remove the first node of this queue (dequeueing)
    # check if val of removed node is target
      # return node if target
      # elsif node is not target, add node's children to queue

  # return nil if we do not find target after iterating through entire loop(s)
end


def DFS(root, target)
  # create stack array
  # add the root node to stack
  # base case: return node if node is target

  # iterate through node's children
    # call DFS on each child node
    # if result is not nil, return node (meaning we found the node we want and we return that node)
    # we don't want to return nil because that could return too early before checking other nodes

  # return nil if target was not found

STACK FRAME 1 -----
  root = a
  target = d

  stack = [a]
  is a == d ? NO

  iteration loop 1 - [b, c]
    DFS(b, target)
    result is not nil, so return node d ^^^

  iteration loop 2 - [c]
    DFS(c, target)

STACK FRAME 2 -----
  root = b
  target = d
  stack = [b]
  is b == d ? NO

  iteration loop 1 - [d, e]
    DFS(d, target) #result from frame 3: NODE D
    result is not nil, so return node d ^^^

  iteration loop 2 - [e]
    DFS(e, target)

STACK FRAME 3 -----
  root = d
  target = d
  stack = [d]
  is d == d ? YES, RETURN NODE D ^^^



end



class Stack
  attr_accessor :elements

  def initialize
    @elements = []
  end


  def push(el)
    elements += [el]
  end


  def pop
    elements = elements[0...-1]
  end


  def peek
    elements[-1]
  end

end


class Queue
  attr_accessor :elements

  def initialize
    @elements = []
  end


  def enqueue(el)
    elements.unshift(el)
    # elements.push(el)
    self
  end


  def dequeue
    elements.pop
    # elements.shift
  end


  def peek
    elements[-1]
  end

  def show
    elements.dup
  end

end


class Map
  attr_accessor :elements

  def initialize
    @elements = Array.new { Array.new(2)}

  end


  def set(key, value)
    unless elements.include?(key)
      elements << [key, value]
    else
      elements.each do |pair|
        pair = [key, value] if pair.include?(key)
      end
    end
  end


  def get(key)
    elements.each do |pair|
      return pair[1] if pair.include?(key)
    end
  end


  def delete(key)
    elements.each do |pair|
      elements.delete(pair) if pair.include?(key)
    end
  end


  def show
    elements
  end

end

