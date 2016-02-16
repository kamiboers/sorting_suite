require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'merge_sort'

class MergeTest < Minitest::Test

  def test_sorts_an_unsorted_array
    test = MergeSort.new
    array = [5, 6, 9, 2, 8, 1, 7, 10, 3, 4]
    assert_equal array.sort, test.sort(array)
  end

  def test_does_not_affect_a_sorted_array
    test = MergeSort.new
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert_equal array, test.sort(array)
  end

  def test_operates_on_letters_as_strings
    test = MergeSort.new
    array = ["d", "c", "b", "a"]
    assert_equal ["a", "b", "c", "d"], test.sort(array)
  end

  def test_ignores_and_returns_empty_or_single_value_arrays
    test = MergeSort.new
    array = []
    assert_equal [], test.sort(array)
    array = [17000]
    assert_equal [17000], test.sort(array)
  end

  def test_reversed_array_returned_sorted
    test = MergeSort.new
    array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    assert_equal array.sort, test.sort(array)
  end


end
