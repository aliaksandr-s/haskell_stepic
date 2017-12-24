Вспомним пример с базой пользователей и паролей:

```haskell
type User = String
type Password = String
type UsersTable = [(User, Password)]
```

Реализуйте функцию, принимающую в качестве окружения UsersTable и возвращающую список пользователей, использующих пароль "123456" (в том же порядке, в котором они перечислены в базе).

```haskell
GHCi> runReader usersWithBadPasswords [("user", "123456"), ("x", "hi"), ("root", "123456")]
["user","root"]
```