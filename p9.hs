
t :: Int -> [Int]
t n = [a*b*(n-a-b)|a<-[1..n],b<-[a..n],a^2+b^2==(n-a-b)^2]
