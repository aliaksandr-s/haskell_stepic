newtype Xor = Xor { getXor :: Bool }
  deriving (Eq,Show)

instance Monoid Xor where
  mempty = Xor False
  Xor a `mappend` Xor b = Xor (a /= b)