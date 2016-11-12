import Euler


p27 :: [ (Int, Int, Int) ]
p27 = max' [(a,b,n) | a <- [(-999), (-997)..999], b <- reverse $ takeWhile ( < 1000 ) primes, let n = kuwa a b, n /= 0, n /= 1 ]
    where
        kuwa a b
            | not ( isPrime (1 + a + b) ) = 0
            | otherwise = last ( takeWhile (\n -> isPrime (n ^ 2 + a * n + b)) [1..] )
        max' xs = filter (\(a,b,n) -> n == maximum [n | (_,_,n) <- xs]) xs

