# Selection Sort
# 1. We traverse through all the elements in the number array.
# 2. We set the current item to be the smallest/minimum.
# 3. If the next number is smaller than the current number, we reassign our reference to the the index of the smallest number.
# 4. If the number we’re looking at is the smallest in size, we swap it with the first element.

require "minitest/autorun"

def selection_sort(array)
  for i in 0...array.length
    puts "\nCurrent array looks like [#{array.join(", ")}]."

    min_index = i
    puts "Min is #{array[min_index]} (index #{min_index})"

    for j in (i + 1)...array.length
      puts "Comparing #{array[j]} and #{array[min_index]}"
      min_index = j if array[j] < array[min_index]

      puts "Min is #{array[min_index]} (index #{min_index})"
    end

    if min_index != i
      puts "Swapping #{array[i]} and #{array[min_index]}"

      array[i], array[min_index] = array[min_index], array[i]
    end
  end

  array
end

describe "selection_sort" do
  it "returns the sorted array" do
    selection_sort([33, 2, 52, 106, 73, 3]).must_equal [2, 3, 33, 52, 73, 106]
  end
end
