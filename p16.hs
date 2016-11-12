
digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = (mod n 10) + digitSum ( div n 10 )

