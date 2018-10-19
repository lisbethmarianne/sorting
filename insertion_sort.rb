# Insertion Sort
# 1. First number is sorted
# 2. Take out unsorted item and compare to sorted items beginning with biggest number, increase index of sorted number if unsorted number is smaller then sorted number, otherwise insert unsorted number
# 3. Take next unsorted item and so on

require "minitest/autorun"

def insertion_sort(array)
  for i in 0...array.length
    puts "\nCurrent array looks like [#{array.join(", ")}]."

    current_unsorted_item = array[i]

    puts "i: #{i}"
    p array[i]
    for j in (i - 1).downto(0)
      puts "j: #{j}"
      p array[j]

      if current_unsorted_item < array[j]
        array[j + 1] = array[j]
        array[j] = current_unsorted_item
      end
    end
  end

  puts "Sorted array looks like [#{array.join(", ")}].\n"

  array
end

describe "insertion_sort" do
  it "returns the sorted array" do
    insertion_sort([33, 2, 52, 106, 73, 3]).must_equal [2, 3, 33, 52, 73, 106]
  end
end
