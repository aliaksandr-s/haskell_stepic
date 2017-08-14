sum'n'count :: Integer -> (Integer, Integer)
sum'n'count n = (sum $ digits n, toInteger . length $ digits n)
  where  
    digits n = map (\x -> read [x] :: Integer) (show $ abs n)