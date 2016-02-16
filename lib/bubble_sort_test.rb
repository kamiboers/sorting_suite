require 'minitest/autorun'
require 'minitest/pride'
require_relative 'bubble_sort'

class BubbleTest < Minitest::Test
  def test_prints_initial_array_of_scrambled_values
    sorter = BubbleSort.new
    assert_equal sorter.print_initial_array([3,1,2]), "Initial array: [3, 1, 2]"
  end

  def test_something_else
    skip
  end

  def test_something_further
    skip
  end

end
