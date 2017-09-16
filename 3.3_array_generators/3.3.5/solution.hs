coins :: (Ord a, Num a) => [a]
coins = [2, 3, 7]

change :: (Ord a, Num a) => a -> [[a]]
change 0 = [[]]
change num = [x:xs | x <- coins, x <= num, xs <- (change $ num - x)]
