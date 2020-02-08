
max_p = 0
max_sum = 0
for p in range(1, 1000):
    sum = 0
    for a in range(1, p):
        for b in range (a, p - a):
            c = p - a -b
            if c**2 == a**2 + b**2:
                print(a, b, c)
                sum += 1
    if sum >= max_sum:
        max_sum = sum
        max_p = p

print(max_sum, max_p)
                
