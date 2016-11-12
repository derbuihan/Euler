import Euler
import Data.Ratio

memo_kuwa :: Integral a => Int -> Ratio a
memo_kuwa = (map kuwa [0..] !!)
    where
        kuwa 0 = 1
        kuwa n = 1 + 1 / (1 + memo_kuwa (n - 1))

taka = length $ filter (\q -> let ken = memo_kuwa q in (digitNum $ numerator $ ken) > (digitNum $ denominator $ ken)) [1..1000]


