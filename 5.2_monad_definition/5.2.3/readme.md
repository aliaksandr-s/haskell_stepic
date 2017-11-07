Реализуйте фукцию bindLog

```haskell
bindLog :: Log a -> (a -> Log b) -> Log b
```
которая работает подобно оператору >>= для контекста Log.

```haskell
GHCi> Log ["nothing done yet"] 0 `bindLog` add1Log
Log ["nothing done yet","added one"] 1

GHCi> Log ["nothing done yet"] 3 `bindLog` add1Log `bindLog` mult2Log
Log ["nothing done yet","added one","multiplied by 2"] 8
```