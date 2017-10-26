Определите представителя класса Functor для следующего типа данных, представляющего точку в трёхмерном пространстве:

```haskell
data Point3D a = Point3D a a a deriving Show
```

```haskell
GHCi> fmap (+ 1) (Point3D 5 6 7)
Point3D 6 7 8
```