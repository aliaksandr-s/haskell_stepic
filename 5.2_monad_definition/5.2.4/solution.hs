import Control.Monad (ap, liftM)
import Control.Applicative
data Log a = Log [String] a deriving Show

instance Monad Log where
  return = returnLog
  (>>=) = bindLog

instance Functor Log where
  fmap = liftM

instance Applicative Log where
  pure = return
  (<*>) = ap

bindLog :: Log a -> (a -> Log b) -> Log b
bindLog (Log log a) f = Log (log ++ log1) res
  where Log log1 res = f a

returnLog :: a -> Log a
returnLog = Log []

execLoggersList :: a -> [a -> Log a] -> Log a
execLoggersList a fs = foldl (\acc x -> acc >>= x) (return a) fs