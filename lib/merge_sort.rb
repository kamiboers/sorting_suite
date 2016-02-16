require 'pry'

class MergeSort

  def initialize
  end

  def sort(array)
    split(array)
  end

  def split(array)
  n = array.length
    return array if n == 1
    midpoint = n/2

     left_array = array[0...midpoint]
     right_array = array[midpoint..n]

     merge(sort(left_array), sort(right_array))
  end

  def merge(left, right)
    sorted =[]
    until left.length == 0 || right.length == 0 do
      if left[0] <= right[0]
        sorted << left.shift
      elsif right[0] <= left[0]
        sorted << right.shift
      else
        sorted << left.shift
        sorted << right.shift
      end
    end
    sorted + left + right
  end


end

test = MergeSort.new
array = (1..10).to_a.shuffle
puts array.to_s
puts test.sort(array).to_s
