import Euler

kuwa = toDigitInt . reverse . toDigitList

taka x = iter (x + kuwa x) 0
    where
        iter x n
            | x == (kuwa x) = n
            | n > 50 = 50
            | otherwise = iter (x + kuwa x) (n + 1)

ken = length $ filter (\x -> (taka x) >= 50) [1..10000]

