main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = map (map read . words) (lines input)
  print $ sum $ map (\l -> fromEnum $ any (\i -> let l' = take i l ++ drop (i + 1) l; d = zipWith (-) l' (tail l') in all (\x -> -4 < x && x < 0) d || all (\x -> 0 < x && x < 4) d) [0..length l - 1]) l