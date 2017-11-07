data Log a = Log [String] a deriving Show

bindLog :: Log a -> (a -> Log b) -> Log b
bindLog (Log log a) f = Log (log ++ log1) res
  where Log log1 res = f a