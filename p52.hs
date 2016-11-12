import Euler
import Data.List

kuwa :: Int -> Int
kuwa x = length $ filter (\y -> ((sort $ toDigitList x) ==) $ sort $ toDigitList $ x * y) [1..6]

taka = head $ filter (\x -> (6 ==) $ kuwa x) [1..]


