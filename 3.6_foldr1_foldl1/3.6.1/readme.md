Напишите реализацию функции, возвращающей последний элемент списка, через foldl1.

```haskell
lastElem :: [a] -> a
lastElem = foldl1 undefined
```
