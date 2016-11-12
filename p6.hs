
p6 :: Int -> Int
p6 n = sum $ map (\ x -> sum $ map (2 * x *) [x+1..n]) [1..n-1]


