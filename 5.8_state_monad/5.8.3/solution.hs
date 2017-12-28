import Data.Monoid
import Control.Monad (ap, liftM, replicateM)

-- state
newtype State s a = State { runState :: s -> (a, s) }

instance Monad (State s) where
  return a = State $ \st -> (a, st)

  m >>= k = State $ \st -> 
    let (a, st') = runState m st
        m' = k a
    in runState m' st'

instance Applicative (State s) where
  pure  = return
  (<*>) = ap

instance Functor (State s) where
  fmap = liftM

execState :: State s a -> s -> s
execState m s = snd (runState m s)

evalState :: State s a -> s -> a
evalState m s = fst (runState m s)

get :: State s s
get = State $ \st -> (st, st)

put :: s -> State s ()
put st = State $ \_ -> ((), st)

-- solution

fibStep :: State (Integer, Integer) ()
fibStep = do
  (a,b) <- get
  put (b, a + b)

execStateN :: Int -> State s a -> s -> s
execStateN n m = execState (replicateM n m)

fib :: Int -> Integer
fib n = fst $ execStateN n fibStep (0, 1)