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

