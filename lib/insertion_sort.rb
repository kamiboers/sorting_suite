class InsertionSort

  def initialize(time=0, time_elapsed=0)
    @time = time
    @time_elapsed = time_elapsed
  end

  def sort(array)
    if array.length == 1
      puts "Sorted Array: #{array}"
    elsif array.length == 0
      puts "Empty Array"
    else
      continue_sort(array)
    end
    array
  end

  def continue_sort(array)
    puts display_unsorted_array(array)
    timer_start
    insert_value_where_greater_than_previous_value(array)
    timer_stop
    return_sorted_array(array)
  end


  def insert_value_where_greater_than_previous_value(array)
    array.each_with_index do |value, position|
      traverse_left = position - 1
      while traverse_left >= 0
        break if array[traverse_left] <= value
        array[traverse_left+1] = array[traverse_left]
        traverse_left -= 1
      end
      array[traverse_left+1] = value
    end
  end

  def display_unsorted_array(array)
    "Unsorted array: #{array.to_s}"
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
  test.sort((1..1000).to_a.shuffle)
end
