
p5 :: Int -> Int
p5 x = foldl (lcm) 1 [1..x]

main = do
		print $ p5 20
