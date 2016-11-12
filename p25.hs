import Euler

main = print $ fst $ head $ filter( ( > ( 10 ^ 999 ) ) . snd ) $ zip [1..] fibs
