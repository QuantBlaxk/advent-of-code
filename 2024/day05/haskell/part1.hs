split :: (Char -> Bool) -> String -> [String]
split p s = case dropWhile p s of "" -> []; s' -> let (w, s'') = break p s' in w : split p s''

check :: [Int] -> [(Int, Int)] -> Bool
check [] _ = True; check [_] _ = True
check (x:y:xs) rules = (x, y) `elem` rules && check (y:xs) rules

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let (orderingRules, updates) = break null (lines input)
  let rules = [(read l, read r) | line <- orderingRules, let [l, r] = split (=='|') line]
  print $ sum $ map (\l -> l !! (length l `div` 2)) (filter (`check` rules) [map read (split (== ',') line) | line <- tail updates])