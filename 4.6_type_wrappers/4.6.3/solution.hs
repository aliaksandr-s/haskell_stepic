import Prelude hiding (lookup)
import qualified Data.List as L

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v
    fromList [] = empty
    fromList ((k,v):xs) = insert k v (fromList xs)

newtype ListMap k v = ListMap { getListMap :: [(k,v)] }
    deriving (Eq,Show)
    
instance MapLike ListMap where
  empty = ListMap []
  lookup _ (ListMap []) = Nothing
  lookup key (ListMap ((k,v):xs))
      | k == key = Just v
      | otherwise = lookup key (ListMap xs)
  insert key newVal (ListMap []) = ListMap [(key, newVal)]
  insert key newVal (ListMap ((k,v):xs)) 
      | key == k = ListMap ((k, newVal):xs)
      | otherwise = let
          (ListMap t) = insert key newVal (ListMap xs)
        in ListMap ((k,v):t) 
  delete key l@(ListMap []) = l
  delete key (ListMap ((k,v):xs))
      | key == k = ListMap xs
      | otherwise = let
          (ListMap t) = delete key (ListMap xs)
        in ListMap ((k,v):t) 