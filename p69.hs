import Euler
import Data.Ratio

x = maximum' (\n -> n % eulerFunc n) [2..100000]

maximum' f xs = arr f xs 0 0
  where
    arr _ [] m i = (m, i)
    arr f (x:xs) m i
      | f x > m = arr f xs (f x) x
      | otherwise = arr f xs m i

