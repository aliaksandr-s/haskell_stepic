newtype Maybe' a = Maybe' { getMaybe :: Maybe a }
  deriving (Eq,Show)

instance Monoid a => Monoid (Maybe' a) where
  mempty = Maybe' $ Just mempty
  (Maybe' Nothing) `mappend` _ = Maybe' Nothing
  _ `mappend` (Maybe' Nothing) = Maybe' Nothing
  (Maybe' a) `mappend` (Maybe' b) = Maybe' (mappend a b)