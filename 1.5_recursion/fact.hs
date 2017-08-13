factorial :: Integer -> Integer

factorial n | n == 0    = 1 
  	    | n > 0     = n * factorial (n - 1)
            | otherwise = error "arg must be >= 0"

factorial2 n | n >= 0    = helper 1 n
	     | otherwise = error "arg must be >=0"

helper acc 0 = acc
helper acc n = helper (acc * n) (n - 1)
