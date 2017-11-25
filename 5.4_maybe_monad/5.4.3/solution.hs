pythagoreanTriple :: Int -> [(Int, Int, Int)]
pythagoreanTriple x = do
  a <- [1..x]
  b <- [1..x]
  c <- [1..x]
  if x <= 0 || b < a then [] else "z"
  if a^2 + b^2 == c^2 then "z" else []
  return (a,b,c)