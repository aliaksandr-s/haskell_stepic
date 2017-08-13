fibonacci :: Integer -> Integer
fibonacci n | n == 0    = 0
            | n == 1    = 1
            | n > 0     = fibonacci (n - 1) + fibonacci (n - 2)
            | otherwise = (-1) ^ (-n + 1) * fibonacci (-n)



fibonacci2 :: Integer -> Integer
fibonacci2 n = helper n 0 1 

helper :: Integer -> Integer -> Integer -> Integer
helper cntr acc1 acc2 | cntr == 0 = acc1
                      | cntr >= 0 = helper (cntr - 1) acc2 (acc1 + acc2)
                      | otherwise = helper (cntr + 1) (acc2 - acc1) acc1 

