# Quick Sort
# Determine a pivot
# Devide larger unsorted collection into two using the pivot
# (move smaller elements to the left and moves larger elements to the right)
# Sort the 2 new arrays (recursion)
# Array is sorted when there is only one element

require "minitest/autorun"

def quick_sort(array, left_index, right_index)
  return array if array.length == 1

  partition_index = partition(array, left_index, right_index)
  puts "Next arrays to sort: #{array[left_index..partition_index - 1]} and "\
    "#{array[partition_index..right_index]}"

  if (left_index < partition_index - 1)
    quick_sort(array, left_index, partition_index - 1)
  end

  if (partition_index < right_index)
    quick_sort(array, partition_index, right_index)
  end

  array
end

def partition(array, left_index, right_index)
  pivot = array[(right_index + left_index) / 2]
  puts "\nSorting #{array[left_index..right_index]}"
  puts "Pivot is #{pivot} (index #{(right_index + left_index) / 2})"

  while (left_index <= right_index)
    while (array[left_index] < pivot)
      puts "#{array[left_index]} < #{pivot}. Incrementing left index to #{left_index + 1}"
      left_index += 1
    end

    while (array[right_index] > pivot)
      right_index -= 1
      puts "#{array[right_index]} > #{pivot}. Decrementing right index to #{right_index - 1}"
    end

    if (left_index <= right_index)
      puts "#{array[left_index]} >= #{pivot} && #{array[right_index]} <= #{pivot}. "\
        "Swapping #{array[left_index]} and #{array[right_index]}"
      swap(array, left_index, right_index)
      left_index += 1
      right_index -= 1
      puts "Incrementing left index to #{left_index}"
      puts "Decrementing right index to #{right_index}"
    end
  end

  left_index
end

def swap(array, left_index, right_index)
  temp_reference = array[left_index]

  array[left_index] = array[right_index]
  array[right_index] = temp_reference
end

describe "quick_sort" do
  it "returns the sorted array" do
    array = [33, 2, 52, 106, 73, 3, 25, 7]

    quick_sort(array, 0, array.length - 1).must_equal [2, 3, 7, 25, 33, 52, 73, 106]
  end
end
