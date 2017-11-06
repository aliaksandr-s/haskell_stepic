Введём следующий тип:

```haskell
data Log a = Log [String] a
```

Реализуйте вычисление с логированием, используя Log. Для начала определите функцию toLogger

```haskell
toLogger :: (a -> b) -> String -> (a -> Log b)
```
которая превращает обычную функцию, в функцию с логированием:

```haskell
GHCi> let add1Log = toLogger (+1) "added one"
GHCi> add1Log 3
Log ["added one"] 4

GHCi> let mult2Log = toLogger (* 2) "multiplied by 2"
GHCi> mult2Log 3
Log ["multiplied by 2"] 6
```

Далее, определите функцию execLoggers

```haskell
execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
```

Которая принимает некоторый элемент и две функции с логированием. execLoggers возвращает результат последовательного применения функций к элементу и список сообщений, которые были выданы при применении каждой из функций:

```haskell
GHCi> execLoggers 3 add1Log mult2Log
Log ["added one","multiplied by 2"] 8
```