evenOnly :: [a] -> [a]
evenOnly = foldr (\(n, val) acc -> if even n then val:acc else acc ) [] . zip [1..] 