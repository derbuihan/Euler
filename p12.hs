import Data.List

primes :: [Int]
primes = 2 : filter isPrime [3,5..]
    where isPrime x = all ( ( 0 /= ) . mod x ) $ takeWhile ( ( <= x ) . ( ^ 2 ) ) primes

factorize :: Int -> [Int]
factorize 1 = []
factorize n = smallPrime : factorize ( n `div` smallPrime )
    where smallPrime = head $ filter ( ( 0 == ) . mod n ) primes

factorize' :: Int -> [(Int, Int)]
factorize' n = map (\xs -> (head xs, length xs)) (group $ factorize n)


divisor :: Int -> [Int]
divisor n = filter ( ( 0 == ) . mod n) [1..n]

divisorNum :: Int -> Int
divisorNum n = product [ x + 1 | ( _, x ) <- factorize' n ]

triangularNumber :: [Int]
triangularNumber = map (\n -> n * ( n + 1 ) `div` 2) [1..]

combination :: [a] -> Int -> [[a]]
combination _ 0 = [[]]
combination [] k = []
combination (x:xs) k =  map (x:) ( combination xs (k - 1) )  ++  combination xs k

permutation :: [a] -> [[a]]
permutation [] = [[]]
permutation x = concat $ map (kuwa x) [1..length x]
    where 
        kuwa x n = map ((x !! (n-1)) :) $ permutation $ cofactor x n
        cofactor x n = take (n-1) x ++ drop n x

