import Data.List
import Euler


n = 10000000000
t = takeWhile ( < n ) triangularNumber
p = takeWhile ( < n ) pentagonalNumber
h = takeWhile ( < n ) hexagonalNumber

x = intersect t p
y = intersect x h

