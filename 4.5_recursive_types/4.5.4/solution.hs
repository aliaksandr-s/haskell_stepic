data Tree a = Leaf a | Node (Tree a) (Tree a)

avg :: Tree Int -> Int
avg t =
    let (c,s) = go t
    in s `div` c
  where
    go :: Tree Int -> (Int,Int)
    go (Leaf a) = (1, a)
    go (Node a b) = (listCount, listVal)
      where 
        listCount = fst (go a) + fst (go b)
        listVal   = snd (go a) + snd (go b)