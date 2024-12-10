import Data.List

trails :: [[Int]] -> (Int, Int) -> [[(Int, Int)]]
trails _map start = move [[start]] []
  where
    move [] visited = visited
    move (p:q) visited
      | _map !! snd (last p) !! fst (last p) == 9 = move q (p : visited)
      | otherwise = let next = [(nx, ny) | (mx, my) <- [(0, -1), (0, 1), (-1, 0), (1, 0)], let nx = fst (last p) + mx, let ny = snd (last p) + my, nx >= 0, nx < length (head _map), ny >= 0, ny < length _map, _map !! ny !! nx == _map !! snd (last p) !! fst (last p) + 1, (nx, ny) `notElem` p] in move (q ++ [p ++ [step] | step <- next]) visited

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = map (map (read . return)) (lines input)
  print $ sum [length $ map head (group (sort (trails l (x, y)))) | x <- [0..length (head l) - 1], y <- [0..length l - 1], l !! y !! x == 0]          