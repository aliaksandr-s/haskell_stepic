Измените определение типа Shopping и доработайте функцию purchase из предыдущего задания таким образом, чтобы можно было реализовать функцию items, возвращающую список купленных товаров (в том же порядке, в котором они были перечислены при покупке):

```haskell
shopping1 :: Shopping
shopping1 = do
  purchase "Jeans"   19200
  purchase "Water"     180
  purchase "Lettuce"   328

GHCi> total shopping1 
19708
GHCi> items shopping1
["Jeans","Water","Lettuce"]
```

Реализуйте функцию items и исправьте функцию total, чтобы она работала как и прежде.