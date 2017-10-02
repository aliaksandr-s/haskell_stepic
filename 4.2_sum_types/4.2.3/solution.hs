data Result' = Fail' Int | Success'

instance Show Result' where
    show (Fail' errCode) = "Fail: " ++ show errCode
    show Success' = "Success"

doSomeWork' :: SomeData -> Result'
doSomeWork' x =
    case doSomeWork x of
      (Success, _) -> Success'
      (_, errCode) -> Fail' errCode