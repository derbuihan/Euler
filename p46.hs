import Data.Numbers.Primes

isSquare n = or $ map (\x -> x^2 == n) [1..n] 

goldbach x = or $ map (\(f, s) -> (isPrime f) && (isSquare (div s 2))) $ [(a, x-a)| a <- [1..x]]

main = print $ head $ filter (\x -> not $  goldbach x) $ filter (\x -> not $ isPrime x) [3,5..]
