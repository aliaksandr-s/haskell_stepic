import Data.Char

data Token = Number Int | Plus | Minus | LeftBrace | RightBrace 
  deriving (Eq, Show)

asToken :: String -> Maybe Token
asToken str
  | all isDigit str = Just $ Number $ read str 
  | str == "+" = Just Plus
  | str == "-" = Just Minus
  | str == ")" = Just RightBrace
  | str == "(" = Just LeftBrace
  | otherwise  = Nothing

tokenize :: String -> Maybe [Token]
tokenize = sequence . map asToken . words