data Nat = Zero | Suc Nat deriving Show

fromNat :: Nat -> Integer
fromNat Zero = 0
fromNat (Suc n) = fromNat n + 1

toNat :: Integer -> Nat
toNat 0 = Zero
toNat a = Suc $ toNat $ a - 1

facI :: Integer -> Integer
facI 0 = 1
facI n = n * facI (n - 1)

add :: Nat -> Nat -> Nat
add a b = toNat $ (fromNat a) + (fromNat b) 

mul :: Nat -> Nat -> Nat
mul a b = toNat $ (fromNat a) * (fromNat b) 


fac :: Nat -> Nat
fac n = toNat . facI . fromNat $ n