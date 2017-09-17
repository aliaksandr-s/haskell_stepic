lengthList :: [a] -> Int
lengthList = foldr (\x xs -> xs + 1) 0