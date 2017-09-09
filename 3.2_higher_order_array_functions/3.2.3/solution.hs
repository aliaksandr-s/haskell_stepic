qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:[]) = [x]
qsort (x:xs) = 
  helper x xs [] []
    where 
  helper pivot [] less bigger = qsort less ++ [pivot] ++ qsort bigger
  helper pivot (x:xs) less bigger 
    | x < pivot  = helper pivot xs (x : less) bigger
    | x >= pivot = helper pivot xs less (x : bigger)