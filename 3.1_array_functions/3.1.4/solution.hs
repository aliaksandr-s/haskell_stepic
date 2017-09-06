isPalindrome :: Eq a => [a] -> Bool
isPalindrome [_] = True 
isPalindrome [] = True
isPalindrome (x:xs) 
  | x /= last xs = False
  | otherwise    = isPalindrome (init xs) 