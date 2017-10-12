maybeToList :: Maybe a -> [a]
maybeToList (Just a) = [a] 
maybeToList Nothing = [] 

listToMaybe :: [a] -> Maybe a
listToMaybe (x:xs) = Just x
listToMaybe [] = Nothing