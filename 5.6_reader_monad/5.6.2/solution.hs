import Control.Monad (ap, liftM)

-- system code
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

type User = String
type Password = String
type UsersTable = [(User, Password)]

usersWithBadPasswords :: Reader UsersTable [User]
usersWithBadPasswords = asks $ foldl (\acc (usr, pwd) -> if pwd == "123456" then acc ++ [usr] else acc) []

usersWithBadPasswords :: Reader UsersTable [User]
usersWithBadPasswords' = asks $ map fst . filter ((=="123456").snd)