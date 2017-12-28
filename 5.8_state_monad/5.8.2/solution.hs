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

-- writer
newtype Writer w a = Writer {runWriter :: (a, w)} deriving Show

writer :: (a, w) -> Writer w a
writer = Writer

execWriter :: Writer w a -> w
execWriter m = snd (runWriter m)

instance (Monoid w) => Monad (Writer w) where
  return x = Writer (x, mempty)
  m >>= k =
    let (x, u) = runWriter m
        (y, v) = runWriter $ k x
    in Writer (y, u `mappend` v)


instance (Monoid w) => Applicative (Writer w) where
  pure  = return
  (<*>) = ap

instance (Monoid w) => Functor (Writer w) where
  fmap = liftM

tell :: Monoid w => w -> Writer w ()
tell w = writer ((), w)

-- solution

writerToState :: Monoid w => Writer w a -> State w a
writerToState (Writer (a, w)) = State $ \e -> (a, e `mappend` w)
