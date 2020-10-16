#PHASE I,  Time Complexity: (n! + n) = O(n!) 
def first_anagram?(str1,str2) #abc, cab
    anagrams = str1.split("").permutation.to_a

    anagrams.each do |anagram|
        if anagram.join("") == str2 #is_anagram?(anagram.join(""), str2)
            return true
        end
    end
    false
end
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

#Phase II, Time Complexity: n * a^3  + n
def second_anagram?(str1,str2)
    key = str2.split("")
    str1.each_char do |char|
        if key.find_index(char) != nil
            idx = key.find_index(char)
            key.delete_at(idx)
        end
    end
    key.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

#PHASE III, Time Complexity: nlogn
def third_anagram?(str1,str2)
    sort_1 = str1.split("") # is this n?
    sort_2 = str2.split("")
    sort_1.sort == sort_2.sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

# PHASE IV, Time Complexity: O(n)
def fourth_anagram?(str1, str2)
    ana_hash1 = Hash.new(0)
    ana_hash2 = Hash.new(0)

    str1.each_char { |char| ana_hash1[char] += 1 }
    str2.each_char { |char| ana_hash2[char] += 1 }

    ana_hash1 == ana_hash2
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

 
def fourth_anagram_b?(str1,str2)
    hash = Hash.new(0)
    str1.each_char { |char| hash[char] += 1 }
    str2.each_char { |char| hash[char] += 1 }
    hash.values.all?{|val| val>=2 && val.even?}
end