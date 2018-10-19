# Bubble Sort
# 1. We start off comparing the first two elements and, if they’re out of order, we swap them.
# 2. We compare the second and third elements, ...
# 3. Iterate again until sorted

require "minitest/autorun"

def bubble_sort(array)
  is_sorted = false

  until is_sorted
    puts "\nCurrent array looks like [#{array.join(", ")}]."

    is_sorted = true

    for i in 0...array.length - 1
      puts "Comparing #{array[i]} and #{array[i + 1]}"

      if array[i + 1] < array[i]
        puts "Swapping #{array[i + 1]} and #{array[i]}"

        is_sorted = false

        min = array[i + 1]
        array[i + 1] = array[i]
        array[i] = min
      end
    end

    puts "Array is sorted? #{is_sorted}"
  end
end

describe "bubble_sort" do
  it "returns the sorted array" do
    bubble_sort([33, 2, 52, 106, 73, 3]).must_equal [2, 3, 33, 52, 73, 106]
  end
end
