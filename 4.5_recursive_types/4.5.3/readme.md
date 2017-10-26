Тип бинарных деревьев можно описать следующим образом:

```haskell
data Tree a = Leaf a | Node (Tree a) (Tree a)
```

Реализуйте функцию height, возвращающую высоту дерева, и функцию size, возвращающую количество узлов в дереве (и внутренних, и листьев). Считается, что дерево, состоящее из одного листа, имеет высоту 0.