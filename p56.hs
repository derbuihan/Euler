import Euler

kuwa =  maximum $ map (\a -> maximum $ map (\b -> digitSum (a ^ b)) [1..100]) [1..100]

