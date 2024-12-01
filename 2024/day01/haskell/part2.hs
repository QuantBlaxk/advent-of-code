main :: IO ()
main = do
  input <- readFile "../input.txt"
  let (l1, l2) = unzip [(read l :: Int, read r :: Int) | line <- lines input, let [l, r] = words line]
  print $ sum $ map (\x -> x * (length $ filter (== x) l2)) l1

