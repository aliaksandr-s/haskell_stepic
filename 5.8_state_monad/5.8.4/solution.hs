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
data Tree a = Leaf a | Fork (Tree a) a (Tree a) deriving Show

-- with monad
numberTree :: Tree () -> Tree Integer
numberTree tree = evalState (helper tree) 1 where
  helper (Leaf _) = do
    n <- get
    put (n+1)
    return $ Leaf n
  helper (Fork left _ right) = do
    left' <- helper left
    n <- get
    put (n+1)
    right' <- helper right
    return $ Fork left' n right'

-- without monad
numberTree' :: Tree () -> Tree Integer
numberTree' tree = fst $ helper tree 1 where
  helper (Leaf _) acc = (Leaf acc, acc + 1)
  helper (Fork left _ right) acc = ((Fork left' (acc1) right'), acc2) where
    (left', acc1) = helper left acc
    (right', acc2) = helper right (acc1 + 1)
