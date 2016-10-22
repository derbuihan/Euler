module Euler where
import Data.List

primes :: Integral a => [a]
primes = 2 : filter isPrime [3,5..]

isPrime :: Integral a => a -> Bool
isPrime x = all ( ( 0 /= ) . mod x ) $ takeWhile ( ( <= x ) . ( ^ 2 ) ) primes

factorize :: Integral a => a -> [a]
factorize 1 = []
factorize n = smallPrime : factorize ( n `div` smallPrime )
    where smallPrime = head $ filter ( ( 0 == ) . mod n ) primes

factorize' :: Integral a => a -> [(a, Int)]
factorize' n = map (\xs -> (head xs, length xs)) (group $ factorize n)

divisor :: Integral a => a -> [a]
divisor n = filter ( ( 0 == ) . mod n) [1..n]

divisor' :: Integral a => a -> [a]
divisor' n = filter ( ( 0 == ) . mod n) [1..1 + div n 2]

divisorNum :: Integral a => a -> Int
divisorNum n = product [ x + 1 | ( _, x ) <- factorize' n ]

divisorSum :: Integral a => a -> a
divisorSum n = product $ map (\x -> sum $ map ( (fst x) ^ ) [0..snd x]) $ factorize' n

divisorSum' :: Integral a =>  a -> a
divisorSum' n = ( product $ map (\x -> sum $ map ( (fst x) ^ ) [0..snd x]) $ factorize' n ) - n

digitSum :: Integral a => a -> a
digitSum 0 = 0
digitSum n = (mod n 10) + digitSum ( div n 10 )

getDigit :: Integral a => a -> Int -> a
getDigit n i
    | i == 0 = mod n 10
    | i > 0 = div (mod n (10 ^ (i+1))) (10 ^ i)
    | otherwise = 0

factorial :: Integral a => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

combination :: [a] -> Int -> [[a]]
combination _ 0 = [[]]
combination [] k = []
combination (x:xs) k =  map (x:) ( combination xs (k - 1) )  ++  combination xs k

permutation :: Eq a => [a] -> [[a]]
permutation [] = [[]]
permutation xs = do
    x <- xs
    map (x:) (permutation $ delete x xs)

coinSum :: Integral a => [a] -> a -> [[a]]
coinSum _ 0 = [[]]
coinSum xs n
    | n < 0 = []
coinSum [x] n
    | mod n x /= 0 = []
    | otherwise = map (x:) $ coinSum (x:[]) (n - x)
coinSum (x:xs) n = (map (x :) $ coinSum (x:xs) (n - x)) ++ (coinSum xs n)

collatz :: Integral a => a -> [a]
collatz 1 = 1 : []
collatz n
    | mod n 2 == 0 = n : collatz ( div n 2 )
    | mod n 2 /= 0 = n : collatz ( 3 * n + 1 )

fibs :: Integral a => [a]
fibs = 1 : 1 :  zipWith (+) fibs ( tail fibs )

triangularNumber :: Integral a => [a]
triangularNumber = map (\n -> n * ( n + 1 ) `div` 2) [1..]

amicable :: Integral a => [a]
amicable = [n |  n <- [1..10000], n == (divisorSum . divisorSum) n, n /= divisorSum n]

perfectNum :: Integral a => [a]
perfectNum = filter (\n -> n == divisorSum' n) [1..]

abundantNum :: Integral a =>  [a]
abundantNum = filter (\n -> n < divisorSum' n) [1..]

deficientNum :: Integral a => [a]
deficientNum = filter (\n -> n > divisorSum' n) [1..]

