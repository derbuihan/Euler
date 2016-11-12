import Data.Function.Memoize

my_fib_memo :: Integer -> Integer
my_fib_memo = memoize my_fib

my_fib :: Integer -> Integer
my_fib 0 = 0
my_fib 1 = 1
my_fib n = my_fib_memo (n - 2) + my_fib_memo (n - 1)
