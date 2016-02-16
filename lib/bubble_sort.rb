require 'pry'

class BubbleSort
  def initialize
  end

def sort(array)
  print_initial_array(array)
  number_times = array.length-2
  loop do
    swapped_values = false
    (0..number_times).each do |pos|
      while array[pos] > array[pos+1]
        array[pos], array[pos+1] = array[pos+1], array[pos]
        binding.pry
        swapped_values = true
        number_times -= 1
      end
    end
  break if swapped_values == false
  end
  print_results(array)
end

def print_initial_array(array)
  "Initial array: #{array.to_s}"
end

def determine_number_of_traverses(array)
  array.length-2
end

def print_results(array)
  "Final array: #{array.to_s}"
end

end

sorter = BubbleSort.new
sorter.sort([5,3,1,4,2])
