Тип LogLevel описывает различные уровни логирования.
```haskell
data LogLevel = Error | Warning | Info
```

Определите функцию cmp, сравнивающую элементы типа 
```haskell
LogLevel так, чтобы было верно, что Error > Warning > Info.
GHCi> cmp Error Warning
GT
GHCI> cmp Info Warning
LT
```