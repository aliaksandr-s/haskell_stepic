data Log a = Log [String] a deriving Show

toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f msg = (\a -> Log [msg] (f a))

execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers el f1 f2 = Log [log1, log2] res2
  where Log [log1] res1 = f1 el
        Log [log2] res2 = f2 res1