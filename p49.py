
def numToList(n):
    r = []
    while (n > 0):
        r.append(n % 10)
        n = n // 10
    r.sort()
    return r

def isPrime(n): # n is odd only.
    if n % 2 == 0:
        return False
    for i in range(3, n, 2):
        if n % i == 0:
            return False
    return True

for i in range(1001, 10000, 2):
    for j in range(i + 2, 10000, 2):
        k = (i + j) // 2
        if numToList(i) == numToList(j) and numToList(i) == numToList(k):
            if isPrime(i) and isPrime(j) and isPrime(k):
                print(i, k, j)

