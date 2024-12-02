main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = map (map read . words) (lines input)
  print $ sum $ map (\l -> let d = zipWith (-) l (tail l) in fromEnum $ all (\x -> -4 < x && x < 0) d || all (\x -> 0 < x && x < 4) d) l