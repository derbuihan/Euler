import Euler

list :: [(Int, Int)]
list = [(n, ( length . collatz ) n)| n <- [1..1000000-1]]

n = muximum $ map snd list

kuwa :: [(Int, Int)]
kuwa = filter ( (n ==) . snd) list





