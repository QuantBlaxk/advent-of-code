import Data.List

countXMAS :: [[Char]] -> Int
countXMAS l = length [() | x <- [1 .. length l - 2], y <- [1 .. length (head l) - 2], l !! (x - 1) !! (y - 1) == 'M', l !! (x - 1) !! (y + 1) == 'S', l !! x !! y == 'A', l !! (x + 1) !! (y - 1) == 'M', l !! (x + 1) !! (y + 1) == 'S']

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = lines input
  print $ sum $ map countXMAS [l, map reverse l, transpose l, map reverse (transpose l)]
