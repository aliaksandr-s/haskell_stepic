meanList :: [Double] -> Double
meanList = (\(s, l) -> s/l) . foldr (\x (s, l) -> (x+s, l+1)) (0,0) 