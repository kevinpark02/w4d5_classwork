def my_min1(arr)
    min = 0
    arr.each do |ele|
        copy = arr.dup  #n
        copy.delete(ele) #n
        min = ele if copy.all?{|num| num > ele } #n
        end
    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list)  # =>  -5

#Time Complexity: O(n^2)

def my_min2(arr)
    min = 0
    arr.each do |num|
        min = num if num < min
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list) # => -5

#Time Complexity: O(n)

def largest_contiguous_subsum1(list)
    last_idx = list.length - 1
    subs = []
   
    (0..last_idx).each do |i|#n^3                          # n^2
        subs << [list[i]]
        (i+1..last_idx).each do |j| #n2
            subs << list[i..j] #n
        end
    end

    subs.map { |sub| sub.sum  }.max# 2n^2
end

list = [5, 3, -7]
p largest_contiguous_subsum1(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum1(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum1(list) # => -1 (from [-1])
# Time Complexity: O(n^3)

def largest_contiguous_subsum2(list)
    cur_sum = list.first
    largest_sum = list.first
    (1..list.length-1).each do |idx|
        cur_sum = 0 if cur_sum < 0 
        cur_sum += list[idx] 
        largest_sum = cur_sum if cur_sum > largest_sum 
    end
    largest_sum
    # cur_sum = [list.first]
    # largest_sum = 0
    # i = 0
    # while i < list.length
    #     j = list.length - 1 - i
    #     if i != j
    #         cur_sum += list[0..i] + list[i+1..j]
    #         p cur_sum
    #         largest_sum = cur_sum.sum if cur_sum.sum > largest_sum
    #     end 
    #     i += 1
    # end
    # largest_sum
end
# Time Complexity: O(n)

#when talking about space complexity
    #as n grows, our space complexity stays 

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])