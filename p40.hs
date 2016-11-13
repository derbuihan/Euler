import Euler
import Data.List

kuwa = concat $ map (toDigitList) [1..]
ken = product $ map (\x -> kuwa !! (10 ^ x - 1)) [0..6]

