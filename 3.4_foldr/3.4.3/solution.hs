sumOdd :: [Integer] -> Integer
sumOdd = foldr isOdd 0 where 
  isOdd x xs | odd x == True = xs + x
             | otherwise     = xs 