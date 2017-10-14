data List a = Nil | Cons a (List a)

fromList :: List a -> [a]
fromList a = case a of Nil -> []
                       Cons a (rest) -> a : fromList rest 

toList :: [a] -> List a
toList [] = Nil
toList (x:xs) = Cons x $ toList xs