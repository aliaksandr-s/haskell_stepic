processData :: SomeData -> String
processData someData = 
    case doSomeWork someData of 
        (Success, _) -> "Success"
        (Fail, errCode) -> "Fail: " ++ show errCode