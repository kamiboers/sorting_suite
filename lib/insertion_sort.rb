class InsertionSort

  def initialize(time=0, time_elapsed=0)
    @time = time
    @time_elapsed = time_elapsed
  end

  def sort(array)
    print_unsorted_array(array)
    timer_start
    traverse_and_insert_value_where_greater_than_previous_value(array)
    timer_stop
    return_sorted_array(array)
  end

  def traverse_and_insert_value_where_greater_than_previous_value(array)
    array.each_with_index do |value, position| #goes through the array from 0 to final position, taking note of value and position in the array
      traverse_left = position - 1 #initially gives the value of the position to the left of the value/position in focus
      while traverse_left >= 0 #ensures that nil doesn't make an appearance by only attempting to compare values if a value exists in the array
        break if array[traverse_left] <= value #exits leftwards traversal if the value to the left is less than the value in focus
        array[traverse_left+1] = array[traverse_left] #places the greater value of the position to the left in the position to its right, this continues until reaching zero
        traverse_left -= 1 #traverses left one place
      end
      array[traverse_left+1] = value #controls for first position's participation, returning array[0] = current value, and places the hanging value of the original position into the array appropriately
    end
  end

  def print_unsorted_array(array)
    puts "Unsorted array: #{array.to_s}"
  end

  def timer_start
    @time = Time.now
  end

  def timer_stop
    @time_elapsed = Time.now - @time
  end

  def return_sorted_array(array)
    puts "Sorted array: #{array.to_s}"
    puts "Seconds elapsed: #{@time_elapsed}"
  end

end

if __FILE__ == $0
  test = InsertionSort.new
  test.sort((1..100).to_a.shuffle)
end
