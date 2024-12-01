import Data.List

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let (l1, l2) = unzip [(read l :: Int, read r :: Int) | line <- lines input, let [l, r] = words line]
  print $ sum $ zipWith (\l r -> abs (l - r)) (sort l1) (sort l2)
