fibonacci :: Integer -> Integer

fibonacci n | n == 0    = 0
	    | n == 1    = 1
            | n > 0     = fibonacci (n - 1) + fibonacci (n - 2)
            | otherwise = (-1) ^ (-n + 1) * fibonacci (-n)
