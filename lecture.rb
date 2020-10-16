# Lecture Objectives
    # Understand motivation for Big O notation
    # Analyze time complexity of common algorithms
    # Explain space complexity

# Motivation behind Big O Notation
    # Provides a way to discuss how long an alogrithm takes to run
    # Allows comparison of efficiency of different apporaches to a problem

# Big O Time Complexity/Runtime
    # Language and metric used to describe the efficiency of an algorithm
    # Epxressed in terms of
        # How fast the run time grows
        # relative to input size
        # as input size gets arbitrarily large

# Time Complexity Analysis
    # Big-O notation describes an algorithm's worst case
    # Big-O talks about orders, not about specifics
        # O(2n) and O(100n) are really both just O(n)

# O(1)
    # Runtime does not grow as input size changes
    # Does not depend on any other factor
def print_one(items)
    puts items[0]
end

def hundred_puts(name)
    100.times { puts "hello, #{name}" }
end

# O(n) Linear Time
def print_one(items)
    items.each { |item| puts item }
end

class Array
    # self is the input, not value
    def include?(value)
        self.each do |el|
            return true if (el == value)
        end
        false
    end
end

# O(n^2) Quadratic Time
def print_numbers(numbers)
    numbers.each do |num_1|
        numbers.each do |num_2|
            puts num_1 + num_2
        end
    end
end

# Logarithmic Time
    # O(log n) Logarithmic Time
    # O(n log n) Linearithmic Time
    # Runtime increases by a log of the input size

# O(2^n)
def subsets(arr)
    return [[]] if arr.empty?
    subs = subsets(arr[0..-2])
    subs.concat(subs.map { |sub| sub + [arr.last] })
end

# O(n!)
def permutations(array)
    return [array] if array.length <= 1

    first = array.shift

    perms = permutations(array)
    total = []

    perms.each do |perm|
        (0...array.length).each do |i|
            total << perm[0...i] + [first] + permi[i..-1]
        end
    end
    total
end

# DEMO TIME

# Ridiculous Sort
def ridiculous_sort(array)
    permutations = array.permutations.to_a #O(n!)

    sorted = permutations.select do |perm| 
        perm == array.sort #O(n log n) or O(n^2)
    end

    sorted.first
end
# This is O(n!) run time

# Takes a message and an incremet amount and outputs an encoded message
def caesar_cipher(str, shift)
    letters = ("a".."z").to_a
    
    encoded_str = ""

    str.each_char do |char|
        if char == ""
            encoded_str << " "
            next
        end

        old_idx = letters.find_index(char)
        new_idx = (old_idx + shift) % letters.length

        encoded_str << letters[new_idx]
    end
    encoded_str
end