import Data.List

revRange :: (Char,Char) -> [Char]
revRange = unfoldr g 
  where g (first, last) = if first > last then Nothing else Just (last, (first, pred last))
