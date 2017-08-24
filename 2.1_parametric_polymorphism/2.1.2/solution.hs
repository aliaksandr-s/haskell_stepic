import Data.Function

multSecond x y = (g `on` h) x y

g = (*)

h = snd