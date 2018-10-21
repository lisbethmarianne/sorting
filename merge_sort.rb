# Merge Sort
# When array has only one element return the (sorted) array
# Split array in the middle
# Sort the 2 arrays (recursion!)
# Merge the 2 arrays

require "minitest/autorun"

def merge_sort(array)
  array_size = array.length
  return array if array_size == 1

  midpoint = (array_size/2).to_i
  left_array = array.slice(0, midpoint)
  right_array = array.slice(midpoint, array_size)

  left_array = merge_sort(left_array)
  right_array = merge_sort(right_array)

  puts "Left array is #{left_array}"
  puts "Right array is #{right_array}"

  merge(left_array, right_array)
end

def merge(array1, array2)
  array = []
  index = 0

  while array1.any? && array2.any?
    array[index] = array1[0] < array2[0] ? array1.shift : array2.shift
    index += 1
  end

  array = array + array1 if array1.any?
  array = array + array2 if array2.any?

  puts "Sorted array is #{array}"
  array
end

describe "merge_sort" do
  it "returns the sorted array" do
    merge_sort([33, 2, 52, 106, 73, 3, 25]).must_equal [2, 3, 25, 33, 52, 73, 106]
  end
end
