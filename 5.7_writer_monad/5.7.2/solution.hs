import Data.Monoid
import Control.Monad (ap, liftM)

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

type Shopping = Writer (Sum Integer) ()

shopping1 :: Shopping
shopping1 = do
  purchase "Jeans"   19200
  purchase "Water"     180
  purchase "Lettuce"   328

-- solution

purchase :: String -> Integer -> Shopping
purchase item cost = writer ((), Sum cost)

total :: Shopping -> Integer
total = getSum . execWriter