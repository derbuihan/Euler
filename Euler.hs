module Euler where
import Data.List

---

primes :: Integral a => [a]
primes = 2 : filter isPrime [3,5..]

isPrime :: Integral a => a -> Bool
isPrime x
    | x > 1 = all ((0 /=) . mod x) $ takeWhile ((<= x) . (^ 2)) primes
    | otherwise = False

factorize :: Integral a => a -> [a]
factorize n = fact n 2
    where
        fact 1 _ = []
        fact n acc = (smallPrime) : fact (n `div` smallPrime) smallPrime
            where smallPrime = head $ filter ((0 ==) . mod n) $ filter (acc <=) primes

factorize' :: Integral a => a -> [(a, Int)]
factorize' n = map (\xs -> (head xs, length xs)) (group $ factorize n)

divisor :: Integral a => a -> [a]
divisor n = filter ((0 ==) . mod n) [1..n]

divisor' :: Integral a => a -> [a]
divisor' n = filter (( 0 == ) . mod n) [1..1 + div n 2]

divisorNum :: Integral a => a -> Int
divisorNum n = product [x + 1 | ( _, x ) <- factorize' n]

divisorSum :: Integral a => a -> a
divisorSum n = product $ map (\x -> sum $ map ((fst x) ^) [0..snd x]) $ factorize' n

divisorSum' :: Integral a =>  a -> a
divisorSum' n = (product $ map (\x -> sum $ map ((fst x) ^) [0..snd x]) $ factorize' n) - n

---

toDigitList :: Integral a => a -> [a]
toDigitList n = iter n []
    where
        iter 0 acc = acc
        iter n acc = iter (div n 10) ((mod n 10) : acc)

toDigitInt :: Integral a => [a] -> a
toDigitInt xs = iter xs 0
    where
        iter [] acc = acc
        iter (x:xs) acc = iter xs (x + 10 * acc)

digitSum :: Integral a => a -> a
digitSum n = iter n 0
    where
        iter 0 acc = acc
        iter n acc = iter (div n 10) (acc + (mod n 10))

digitNum :: Integral a => a -> a
digitNum n = iter n 0
    where
        iter 0 acc = acc
        iter n acc = iter (div n 10) (acc + 1)

getDigit :: Integral a => a -> Int -> a
getDigit n i
    | i == 0 = mod n 10
    | i > 0 = div (mod n (10 ^ (i+1))) (10 ^ i)
    | otherwise = 0

---

factorial :: Integral a => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

combination :: [a] -> Int -> [[a]]
combination _ 0 = [[]]
combination [] k = []
combination (x:xs) k =  map (x:) (combination xs (k - 1))  ++  (combination xs k)

combination' :: Integral a => a -> a -> a
combination' n r
    | (n >= 0) && (r >= 0 ) && (r <= n) = div (div (factorial n) (factorial r)) (factorial (n - r))
    | otherwise = 0

permutations' :: Eq a => [a] -> [[a]]
permutations' [] = [[]]
permutations' xs = do
    x <- xs
    map (x:) (permutations' $ delete x xs)

coinSum :: Integral a => [a] -> a -> [[a]]
coinSum _ n
    | n == 0 = [[]]
    | n < 0 = []
coinSum [x] n
    | mod n x /= 0 = []
    | otherwise = map (x:) $ coinSum (x:[]) (n - x)
coinSum (x:xs) n = (map (x :) $ coinSum (x:xs) (n - x)) ++ (coinSum xs n)

directionaryOrder :: (Ord a) => [a] -> Int
directionaryOrder [] = 1
directionaryOrder all@(x:xs) = (order (sort all) x) * factorial (length xs) + directionaryOrder (xs)

order :: (Eq a) => [a] -> a -> Int
order xs y = iter xs y 0
    where
        iter (x:xs) y acc
            | x == y = acc
            | x /= y = iter xs y (acc + 1)

sumList :: (Num a) => [a] -> [(a,Int)]
sumList xs = iter xs 0 0
    where
        iter [] _ acc = []
        iter (x:xs) y acc = ((x + acc), y+1) : iter xs (y + 1) (x + acc)

---

collatz :: Integral a => a -> [a]
collatz 1 = 1 : []
collatz n
    | mod n 2 == 0 = n : collatz (div n 2)
    | mod n 2 /= 0 = n : collatz (3 * n + 1)

fibs :: Integral a => [a]
fibs = 1 : 1 :  zipWith (+) fibs ( tail fibs )

triangularNumber :: Integral a => [a]
triangularNumber = map (\n -> n * (n + 1) `div` 2) [1..]

amicable :: Integral a => [a]
amicable = [n |  n <- [1..10000], n == (divisorSum . divisorSum) n, n /= divisorSum n]

perfectNum :: Integral a => [a]
perfectNum = filter (\n -> n == divisorSum' n) [1..]

abundantNum :: Integral a =>  [a]
abundantNum = filter (\n -> n < divisorSum' n) [1..]

deficientNum :: Integral a => [a]
deficientNum = filter (\n -> n > divisorSum' n) [1..]

