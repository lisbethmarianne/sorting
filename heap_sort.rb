# Heap Sort
# 1. Build a max heap from array
# 2. move the largest value (root node) to the end of the heap
# by swapping it with the last element
# --> last item is now sorted
# 3. move new root node down to correct place

require "minitest/autorun"
require "colorize"

def heap_sort(array)
  puts "Start array: #{array}"

  # Build our max heap.
  build_max_heap(array)
  puts "Heapified:   #{array}"

  # Find last element.
  last_element = array.length - 1

  # Continue heap sorting until we have
  # just one element left in the array.
  while last_element > 0 do
    swap(array, 0, last_element)
    last_element -= 1
    puts "Swapped:     #{array[0..last_element]}" +
      "#{array[last_element + 1..array.length - 1]}".red

    heapify(array, 0, last_element)
    puts "Heapified:   #{array[0..last_element]}" +
      "#{array[last_element + 1..array.length - 1]}".red
  end

  puts "Final array: " + "#{array}".red
  array
end

def build_max_heap(array)
  i = array.length / 2 - 1

  # Build a max heap out of
  # all array elements passed in.
  while i >= 0 do
    heapify(array, i, array.length - 1)
    i -= 1
  end
end

def heapify(heap, i, max)
  while i <= max do
    index = i

    left_child = 2 * i + 1
    right_child = left_child + 1

    if left_child <= max && heap[left_child] > heap[index]
      index = left_child
    end

    if right_child <= max && heap[right_child] > heap[index]
      index = right_child
    end

    if index == i
      return
    end

    swap(heap, i, index)

    i = index
  end
end

def swap(array, first_item_index, last_item_index)
  tmp = array[first_item_index]

  # Swap first and last items in the array
  array[first_item_index] = array[last_item_index]
  array[last_item_index] = tmp
end

describe "heap_sort" do
  it "returns the sorted array" do
    array = [33, 2, 52, 106, 73, 3, 25, 7]

    heap_sort(array).must_equal [2, 3, 7, 25, 33, 52, 73, 106]
  end
end
