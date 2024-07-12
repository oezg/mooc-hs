module Scatches.RealWorld where

questionnaire = do
  putStrLn "Write something!"
  s <- getLine
  putStrLn ("You wrote: " ++ s)

query :: IO ()
query = do
  putStrLn "Write something!"
  s <- getLine
  let n = length s
  putStrLn ("You wrote " ++ show n ++ " characters")

askForALine :: IO String
askForALine = do
  putStrLn "give me a line"
  getLine

askQuestion :: String -> IO String
askQuestion question = do
  putStrLn question
  getLine

yesNoQuestion :: String -> IO Bool
yesNoQuestion question = do
  putStrLn question
  s <- getLine
  return (s == "Y")

printDescription :: Int -> IO ()
printDescription n
  | even n = putStrLn "even"
  | n == 3 = putStrLn "three"
  | otherwise = print n

printList :: [Int] -> IO ()
printList [] = return () -- do nothing
printList (x : xs) = do
  print x
  printList xs -- recursion

readAndSum :: Int -> IO Int
readAndSum 0 = return 0
readAndSum n = do
  i <- readLn -- read one number
  s <- readAndSum (n - 1) -- recursion: read and sum rest of numbers
  return (i + s) -- produce result