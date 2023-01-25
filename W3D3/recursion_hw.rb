require 'byebug'

#Exercise 1
def sum_to(n)
  return 1 if n == 1
  return nil if n <= 0
  n + sum_to(n - 1)
end

# sum_to(5)  # => returns 15
# sum_to(1)  # => returns 1
# sum_to(9)  # => returns 45
# sum_to(-8)  # => returns nil


#Exercise 2
def add_numbers(nums_arr)
  return nums_arr[0] if nums_arr.length <= 1
  return nil if nums_arr.length == 0
  sum = 0
  sum += nums_arr.pop
  sum += add_numbers(nums_arr)
end

# add_numbers([1,2,3,4]) # => returns 10
# add_numbers([3]) # => returns 3
# add_numbers([-80,34,7]) # => returns -39
# add_numbers([]) # => returns nil


#Exercise 3
def gamma_fnc(n)
  # debugger
  return nil if n == 0
  return 1 if n <= 2
  (n - 1) * gamma_fnc(n - 1)
end

# gamma_fnc(0)  # => returns nil
# gamma_fnc(1)  # => returns 1
# gamma_fnc(4)  # => returns 6
# gamma_fnc(8)  # => returns 5040


#Exercise 4
def ice_cream_shop(flavors, favorite)
  return false if flavors.length == 0
  return true if flavors.shift == favorite
  ice_cream_shop(flavors, favorite)
end

# ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# ice_cream_shop([], 'honey lavender')  # => returns false


#Exercise 5
def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..-2])
end

# reverse("house") # => "esuoh"
# reverse("dog") # => "god"
# reverse("atom") # => "mota"
# reverse("q") # => "q"
# reverse("id") # => "di"
# reverse("") # => ""