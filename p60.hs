import Data.Numbers.Primes
import Data.List

primes' = filter (\x -> (x /= 2) && (x /= 5)) primes -- primes except 2,5

comp x y = x * 10 ^ (length $ show y) + y

isPrime_comp x y = (isPrime $ comp x y) && (isPrime $ comp y x)

isPrime_comp' x y z = (isPrime_comp x z) && (isPrime_comp y z)

isPrime_comp'' x y z a b = (isPrime_comp' a b x) && (isPrime_comp' a b y) && (isPrime_comp' a b z)

p60 = [(x, y) | y <- primes', x <- takeWhile (< y) primes', isPrime_comp x y ]

p60' a b = [(x, y, z) | (x, y) <- p60, z <- filter (> x) $ takeWhile (< y) primes', (a, b) /= (x, y), a /= z, b/= z, isPrime_comp' x y z]  

p60'' = [(a, b, x, y, z) | (a , b) <- p60, (x, y, z) <- p60' a b, isPrime_comp'' x y z a b]

