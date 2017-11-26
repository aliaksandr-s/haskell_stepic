import System.Directory
import Control.Monad
import Data.List

main :: IO ()
main = do
  putStr "Substring: "
  substr <- getLine
  content <- getDirectoryContents "."
  let filtered = filter (isInfixOf substr) content
  if substr == "" 
    then putStrLn $ "Canceled" 
    else mapM_ deleteFile filtered

deleteFile :: String -> IO ()
deleteFile name = do
  putStrLn $ "Removing file: " ++ name
  removeFile name