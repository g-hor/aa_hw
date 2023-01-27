class Stack

  def initialize
    @elements = []
  end


  def push(el)
    @elements += [el]
  end


  def pop
    @elements = @elements[0...-1]
  end


  def peek
    @elements[-1]
  end

end


class Queue

  def initialize
    @elements = []
  end


  def enqueue(el)
    @elements.unshift(el)
  end


  def dequeue
    @elements.pop
  end


  def peek
    @elements[-1]
  end

end


class Map

  def initialize
    @elements = Array.new { Array.new(2)}
  end


  def set(key, value)
    unless @elements.include?(key)
      @elements << [key, value]
    else
      @elements.each do |pair|
        pair = [key, value] if pair.include?(key)
      end
    end
  end


  def get(key)
    @elements.each do |pair|
      return pair[1] if pair.include?(key)
    end
  end


  def delete(key)
    @elements.each do |pair|
      @elements.delete(pair) if pair.include?(key)
    end
  end


  def show
    @elements
  end

end