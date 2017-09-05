oddsOnly :: Integral a => [a] -> [a]
oddsOnly list =
  helper [] list 
    where
  helper newList list
    | length list == 0 = reverse newList
    | (odd . head $ list) == True = helper (head list : newList) (tail list)
    | otherwise = helper newList (tail list)

oddsOnly' :: Integral a => [a] -> [a]
oddsOnly' [] = []
oddsOnly' (x : xs)
  | odd x = x : oddsOnly' xs
  | otherwise = oddsOnly' xs
    