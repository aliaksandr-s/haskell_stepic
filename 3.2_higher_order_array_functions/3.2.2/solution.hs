filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj cond1 cond2 list = filter isTrue list
  where 
    isTrue arg = (cond1 arg) || (cond2 arg)
  