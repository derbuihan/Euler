import Data.List
import Data.Numbers.Primes

kuwa = maximum $ concat $ map (\x -> filter (isPrime) $ map (toInt) (permutations [1..x]) ) [1..9]
  where toInt [x] = x
        toInt (x:xs) = x + 10 * toInt xs

