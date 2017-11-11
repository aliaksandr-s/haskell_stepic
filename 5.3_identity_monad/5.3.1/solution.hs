instance Functor SomeType where
  fmap f a = a >>= return . f