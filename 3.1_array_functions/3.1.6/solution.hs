groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems list = sublist : groupElems rest
  where 
    (sublist, rest) = span (== head list) list
