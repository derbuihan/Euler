import Data.Numbers.Primes

tail' n = (read $ tail $ show n) :: Int
init' n = (read $ init $ show n) :: Int

inits n
  | 0 <= n && n < 10 = []
  | otherwise = m : (inits m)
  where
    m = init' n

tails n
  | 0 <= n && n < 10 = []
  | otherwise = m : (tails m)
  where
    m = tail' n

rec n = (inits n) ++ (tails n)

p37 = sum $ filter (\n -> all isPrime (rec n)) $ takeWhile (< 1000000) $ filter (> 10) primes

