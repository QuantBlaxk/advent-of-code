import Data.List

countXMAS :: String -> Int
countXMAS s
  | s == [] = 0
  | "XMAS" `isPrefixOf` s = 1 + (countXMAS $ drop 4 s)
  | otherwise = countXMAS $ drop 1 s

diagonals :: [[a]] -> [[a]]
diagonals g = [[g !! (i + k) !! k | k <- [0 .. min (m - i - 1) (n - 1)]] | let m = length g, let n = length $ head g, i <- [0 .. m - 1]] ++ [[g !! k !! (i + k) | k <- [0 .. min (m - 1) (n - i - 1)]] | let m = (length g), let n = length $ head g, i <- [1 .. n - 1]]

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = lines input
  print $ sum $ [sum $ map (\l -> countXMAS l + countXMAS (reverse l)) l | l <- [l, transpose l, diagonals l, diagonals (map reverse l)]]
