# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
  biggest_fish = ""

  arr.each do |fish1|
    arr.each do |fish2|
      biggest_fish = fish1
      biggest_fish = fish2 if biggest_fish.length < fish2.length
    end
  end

  biggest_fish
end


def dominant_octopus(arr)
  return arr if arr.length < 2

  mid = arr.length/2
  left = dominant_octopus(arr[0...mid])
  right = dominant_octopus(arr[mid..-1])

  merge_fish(left, right)
end


def merge_fish(left, right)
  merged = []

  until left.empty? || right.empty?
    if left[0].length < right[0].length
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end


def clever_octopus(arr)

end