import Euler
import Data.List

kuwa = map (\x -> map toDigitInt (permutations x)) (combination [1..9] 4)

taka [] = 0
taka (x:xs)
    | isPrime x = 1 + taka xs
    | not (isPrime x) = taka xs

taka' [] = []
taka' (x:xs)
    | isPrime x = x : taka' xs
    | not (isPrime x) = taka' xs

ponya = map (sort . taka') $ filter (\x -> (taka x) >= 2) kuwa

ken xs = any (\x -> elem (div (sum x) 2) xs) (combination xs 2)

tarou = filter ken ponya


