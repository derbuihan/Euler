
digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = (mod n 10) + digitSum ( div n 10 )

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

