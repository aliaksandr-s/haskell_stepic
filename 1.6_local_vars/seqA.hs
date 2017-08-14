seqA :: Integer -> Integer
seqA n | n >= 0 = let
           helper acc1 acc2 acc3 0 = acc1
           helper acc1 acc2 acc3 1 = acc2
           helper acc1 acc2 acc3 2 = acc3
           helper acc1 acc2 acc3 n = helper acc2 acc3 (acc3 + acc2 - 2 * acc1) (n - 1) 
         in helper 1 2 3 n       
       | otherwise = error "Args must be >= 0"

    