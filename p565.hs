import Euler

s :: Integer -> Integer -> Integer
s n d = sum $ filter (\k -> 0 == ( mod (divisorSum k) d ) ) [1..n]

