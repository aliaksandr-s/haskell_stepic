main :: IO ()
main = do
  putStr "What is your name?\nName: "
  name <- getLine
  if name == "" then main else putStrLn $ "Hi, " ++ name ++ "!"