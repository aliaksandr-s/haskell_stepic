Используя монаду списка и do-нотацию, реализуйте функцию

```haskell
pythagoreanTriple :: Int -> [(Int, Int, Int)]
```
которая принимает на вход некоторое число xx и возвращает список троек (a,b,c)(a,b,c), таких что

a2+b2=c2,a>0,b>0,c>0,c≤x,a<ba2+b2=c2,a>0,b>0,c>0,c≤x,a<b  

Число xx может быть ≤0≤0 , на таком входе должен возвращаться пустой список.

```haskell
GHCi> pythagoreanTriple 5
[(3,4,5)]

GHCi> pythagoreanTriple 0
[]

GHCi> pythagoreanTriple 10
[(3,4,5),(6,8,10)]
```