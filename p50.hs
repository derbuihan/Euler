import Euler

kuwa = takeWhile ([] /=) $ map (\xs -> takeWhile (\(x,y) -> x < 1000000) $ filter (\p -> isPrime (fst p)) $ tail xs) (map sumList $ taka primes)

kenta = map (last) kuwa

rou = maximum $ map snd kenta

ponya = filter (\(a,b) -> (b == rou)) kenta

taka :: [a] -> [[a]]
taka [] = []
taka xs = xs : taka (tail xs)


