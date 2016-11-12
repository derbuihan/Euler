import Euler

amicable :: [ Int ]
amicable = [ n |  n <- [1..10000], n == (divisorSum . divisorSum) n, n /= divisorSum n ]


