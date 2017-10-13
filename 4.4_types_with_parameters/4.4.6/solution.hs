import Data.List.Split (splitOn)
import Data.Char (isDigit)

data Error = ParsingError | IncompleteDataError | IncorrectDataError String deriving Show

data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving Show

parsePerson :: String -> Either Error Person
parsePerson str = check userData where
  
  userData = map (splitOn " = ") $ splitOn "\n" str

  isParsedCorrectyly [field, value] = True
  isParsedCorrectyly _ = False

  checkIfDataCorrect [["firstName", firstName], ["lastName", lastName], ["age", ageVal]]
    | all isDigit ageVal = Right (Person firstName lastName (read ageVal :: Int))
    | otherwise = Left (IncorrectDataError ageVal)

  checkIfAllFields list@[["firstName", _], ["lastName", _], ["age", _]] = checkIfDataCorrect list
  checkIfAllFields _ = Left (IncompleteDataError)

  check fields
    | all isParsedCorrectyly fields = checkIfAllFields fields
    | otherwise = Left (ParsingError)