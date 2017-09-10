perms :: [a] -> [[a]]
perms [] = [[]]
perms [x] = [[x]]
perms (x:xs) = concatMap (\n -> (ins x n)) (perms xs)
  where 
    ins elem list = map (\n -> (take n list) ++ [elem] ++ (drop n list)) [0..(length list)]