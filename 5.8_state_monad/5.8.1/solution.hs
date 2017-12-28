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

-- reader
data Reader r a = Reader { runReader :: (r -> a) }

instance Monad (Reader r) where
  return x = Reader $ \_ -> x
  m >>= k  = Reader $ \r -> runReader (k (runReader m r)) r

instance Applicative (Reader m) where
  pure  = return
  (<*>) = ap

instance Functor (Reader m) where
  fmap = liftM

asks :: (r -> a) -> Reader r a
asks = Reader

-- solution

readerToState :: Reader r a -> State r a
readerToState m = State $ \a -> (runReader m a, a)
