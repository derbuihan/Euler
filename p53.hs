import Euler

kuwa = length [c | n <- [1..100], r <- [0..n], let c = combination' n r, c > 1000000]

