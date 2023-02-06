class LRUCache


  def initialize(max)
    self.capacity = max
    self.cache = []
  end


  def count
    self.cache.length
  end

  
  def add(ele)
    if self.cache.include?(ele)
      self.cache.delete(ele)
      self.cache << ele
    else
      if self.at_capacity?
        self.cache.shift
        self.cache << ele
      else
        self.cache << ele
      end
    end
  end


  def show
    print self.cache
  end


  private

  def at_capacity?
    self.count == self.capacity
  end

  attr_accessor :capacity, :cache
end


johnny_cache = LRUCache.new(4)

  p johnny_cache.add("I walk the line")
  p johnny_cache.add(5)

  p johnny_cache.count # => returns 2

  p johnny_cache.add([1,2,3])
  p johnny_cache.add(5)
  p johnny_cache.add(-5)
  p johnny_cache.add({a: 1, b: 2, c: 3})
  p johnny_cache.add([1,2,3,4])
  p johnny_cache.add("I walk the line")
  p johnny_cache.add(:ring_of_fire)
  p johnny_cache.add("I walk the line")
  p johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]