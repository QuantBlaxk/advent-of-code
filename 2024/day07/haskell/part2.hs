check :: [Int] -> Int  -> Int -> Bool
check [x] c t = (c + x) == t || (c * x) == t || read (show c ++ show x) == t
check (x:xs) c t
  | c > t = False
  | otherwise = check xs (c + x) t || check xs (c * x) t || check xs (read (show c ++ show x)) t

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = map (\l -> map (read :: String -> Int) (init (head l) : tail l)) (map words (lines input))
  print $ sum $ map (\l -> if check (tail l) 0 (head l) then head l else 0) l