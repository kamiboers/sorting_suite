require_relative 'lib/bubble_sort.rb'
require_relative 'lib/insertion_sort.rb'
require_relative 'lib/merge_sort.rb'
  
module SortingSuite

end

SortingSuite < BubbleSort
SortingSuite < InitializeSort
SortingSuite < MergeSort

if __FILE__ == $0
bubbles = SortingSuite::BubbleSort.new
bubbles.sort([3,2,1])
end
