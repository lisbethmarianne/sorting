# Counting Sort
# sorts an array with integers only
# used if the range of input values (k) isn’t greater than the number of values to be sorted (n)
# O(n + k) -> O(n) == linear

# 1. create counting array and count how often an element appears in the array
# 2. move elements into their sorted location

require "minitest/autorun"
require "colorize"

def counting_sort(array, range)
  # create a counting array
  counts = Array.new(range, 0)

  puts "Counting array: #{counts}".blue

  # populate counting array
  for num in array
    counts[num] += 1
  end

  puts "Counting array: #{counts}".blue

  # modify array and move elements into their sorted location
  index = 0
  counts.each_with_index do |count, count_index|
    while count > 0
      array[index] = count_index
      count -= 1
      index += 1
    end
  end

  puts "Sorted array: #{array}".red

  array
end

describe "counting_sort" do
  it "returns the sorted array" do
    array = [9, 4, 1, 7, 9, 1, 2, 0]

    counting_sort(array, 10).must_equal [0, 1, 1, 2, 4, 7, 9, 9]
  end
end
