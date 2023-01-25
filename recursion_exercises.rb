# Warmup
def range(first, last)
    return [first] if first == last
    [first] + range(first + 1, last)
end

def range1(first, last)
    output = []
    (first..last).each do |i|
        output << i
    end
    output
end

# p range1(1, 5)
# p range1(3, 10)

def recursion1(b, n)
    return 1 if n == 0
    b * recursion1(b, n - 1)
end

# p recursion1(2, 4)
# p recursion1(3, 3)

def recursion2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        recursion2(b, n / 2) * recursion2(b, n / 2)
    else
        b * (recursion2(b, (n - 1) / 2) * recursion2(b, (n - 1)/ 2))
    end
end

# p recursion2(2, 7)


# Deep Dup

class Array

    def deep_dup
        return [] if self.empty?
        output = []
        self.each do |ele|
            if !ele.is_a? Array
                output << ele
            else
                output << ele.deep_dup
            end
        end
        output
    end

end


# arr = [1, [2], [3, [4]]]
# new_arr = arr.deep_dup

# p arr
# p new_arr

# new_arr[1][0] = 6

# p arr
# p new_arr


# fib[1] = 0
# fib[2] = 1

# fib[3] = 1
# fib[4] = 2
# fib[5] = 3
# fib[6] = 5

def fib_array(n)
    return [0] if n == 1
    return [0, 1] if n == 2

    fib_array(n - 1) << fib_array(n - 1)[-1] + fib_array(n - 2)[-1]
end

# p fib_array(7)


def bsearch(array, target)
    return nil if array.empty?
    mid = array.length / 2
    current = array[mid]
    return mid if current == target
    if target < current
        return bsearch(array[0...mid], target)
    else
        iterative_step = bsearch(array[mid + 1..-1], target)
        if !iterative_step
            return nil
        else
            return mid + 1 + iterative_step
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length <= 1
    mid = arr.length / 2
    merge(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))
end


def merge(arr_1, arr_2)
    merged = []

    while !arr_1.empty? && !arr_2.empty?
        if arr_1[0] < arr_2[0]
            num = arr_1.shift
            merged << num
        else
            num = arr_2.shift
            merged << num
        end
    end
    merged + arr_1 + arr_2
end

# arr = [4, 2, 6, 5, 1, 0, 7, 3]

# p merge_sort(arr)


