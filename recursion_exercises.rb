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

