import Euler
import Data.Numbers.Primes

x = map f $ map toDigitList [1..1000000]
y = length $ filter (\xs -> all isPrime xs) x

f xs = arr xs $ length xs
  where
    arr _ 0 = []
    arr xs n = (toDigitInt xs) : arr (tail xs ++ [head xs]) (n - 1)

