data Coord a = Coord a a

distance :: Coord Double -> Coord Double -> Double
distance (Coord x1 y1) (Coord x2 y2) = 
  sqrt $ (x1 - x2)^2 + (y1 - y2)^2

manhDistance :: Coord Int -> Coord Int -> Int
manhDistance (Coord p1 p2) (Coord q1 q2) =
  abs (p1 - q1) + abs (p2 - q2)