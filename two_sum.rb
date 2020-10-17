require "byebug"

def bad_two_sum?(arr, target)
    perfect_sum = []

    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if idx2 > idx1
                return true if ele1 + ele2 == target
            end
        end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

# def okay_two_sum?(arr, target)
#     debugger
#     sorted = arr.sort 
#     mid = arr.length/2
#     return true if arr[mid] == target

#     if target < sorted[mid]
#         left = sorted[0...mid]
#         okay_two_sum?(left, target)
#     else
#         right = sorted[mid+1..sorted.length-1]
#         okay_two_sum?(right, target)
#     end
#     false
# end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
    hash = Hash.new

    arr.each do |ele|
        return true if hash[target - ele]
        hash[ele] = true
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6)
p two_sum?(arr, 10)