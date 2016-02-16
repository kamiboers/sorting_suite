require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'bubblier'

class BubbleTest < Minitest::Test

  def test_initial_time_is_nil
    test = BubbleSort.new
    assert @time_start==nil
  end

  def test_timer_records_static_starting_time
    test = BubbleSort.new
    new_time = test.timer_start
    assert new_time != nil
    assert new_time.class == Time
    assert new_time != Time.now
  end

  def test_prints_original_scrambled_array
    test = BubbleSort.new
    assert_equal "\nScrambled values:\n [4, 1, 2, 3]", test.display_original([4,1,2,3])
  end

  def test_recognizes_neighbors_out_of_order
    test = BubbleSort.new
    assert test.neighbors_out_of_order?([2,1])
    refute test.neighbors_out_of_order?([1,2])
  end

  def test_swap_two_positions_on_demand
    test = BubbleSort.new
    assert_equal [1,2], test.switch_neighboring_value_order([2,1])
    assert_equal [2,1], test.switch_neighboring_value_order([1,2])
  end

  def test_swap_only_when_out_of_order
    test = BubbleSort.new
    assert_equal [1,2], test.compare_neighboring_values([2,1], 0)
    assert_equal [1,2], test.compare_neighboring_values([1,2], 0)
  end

  def test_sorts_an_unsorted_array
    test = BubbleSort.new
    array = [5, 6, 9, 2, 8, 1, 7, 10, 3, 4]
    assert_equal array.sort, test.sort(array)
  end

  def test_does_not_affect_a_sorted_array
    test = BubbleSort.new
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert_equal array, test.sort(array)
  end

  def test_operates_on_letters_as_strings
    test = BubbleSort.new
    array = ["d", "c", "b", "a"]
    assert_equal ["a", "b", "c", "d"], test.sort(array)
  end

  def value_switch_records_switch_invalidates_sorted_traverse
    test = BubbleSort.new
    @sorted = true
    @switches = 0
    test.one_value_switch_occurs
    assert_equal false, @sorted
    assert_equal 1, @switches
  end

  def traverse_marks_final_value_sorted
    test = BubbleSort.new
    @num_fewer_comparisons = 0
    array = [5,4,3,2,1]
    test.traverse(array)
    assert_equal 1, @num_fewer_comparisons
  end


  def timer_stop_returns_elapsed_time
    test = BubbleSort.new
    test.timer_start
    time_elapsed = test.timer_stop
    assert_equal Time, time_elapsed.class
  end

end
