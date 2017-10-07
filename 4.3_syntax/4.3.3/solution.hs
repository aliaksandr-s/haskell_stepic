data Person = Person { firstName :: String, lastName :: String, age :: Int }
  deriving (Show, Eq)

abbrFirstName :: Person -> Person
abbrFirstName person
  | (length $ firstName person) <= 2 = person 
  | otherwise = person {firstName = (firstName person)!!0 : "."}
                                                                