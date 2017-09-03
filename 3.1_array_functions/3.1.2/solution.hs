nTimes:: a -> Int -> [a]
nTimes elem times = 
  helper [] elem times 
    where
  helper list elem counter
    | counter == 0 = list
    | otherwise = helper (elem : list) elem (counter - 1)