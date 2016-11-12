import Data.List

main = print $ length $ map (head) (group $ sort [a ^ b | a <- [2..100], b <- [2..100]])
