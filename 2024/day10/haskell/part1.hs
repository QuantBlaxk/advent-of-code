traillast :: [[Int]] -> (Int, Int) -> [(Int, Int)]
traillast _map start = move [start] []
  where
    move [] visited = filter (\(x, y) -> _map !! y !! x == 9) visited
    move ((x, y):q) visited = let next = [(nx, ny) | (mx, my) <- [(0, -1), (0, 1), (-1, 0), (1, 0)], let nx = x + mx, let ny = y + my, nx >= 0, nx < length (head _map), ny >= 0, ny < length _map, _map !! ny !! nx == _map !! y !! x + 1, (nx, ny) `notElem` visited] in move (q ++ next) (visited ++ next)

main :: IO ()
main = do
  input <- readFile "../input.txt"
  let l = map (map (read . return)) (lines input)
  print $ sum [length (traillast l (x, y)) | x <- [0..length (head l) - 1], y <- [0..length l - 1], l !! y !! x == 0]