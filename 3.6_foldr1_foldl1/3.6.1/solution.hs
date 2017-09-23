lastElem :: [a] -> a
lastElem = foldl1 (\x acc -> acc)
