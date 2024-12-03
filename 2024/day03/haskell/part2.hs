import Data.Char (isDigit)
import Data.List (isPrefixOf)

sumOfMults :: String -> Int
sumOfMults [] = 0
sumOfMults s
    | "mul(" `isPrefixOf` s =
        let (n1, r) = span isDigit $ drop 4 s; (n2, r2) = span isDigit (drop 1 r)
        in if not (null n1) && not (null n2) && r2 /= "" && head r2 == ')'
            then read n1 * read n2 + sumOfMults (tail r)
            else sumOfMults (tail s)
    | otherwise = sumOfMults (tail s)

filterDo :: String -> Bool -> String
filterDo [] _ = ""
filterDo s d
    | "do()" `isPrefixOf` s = filterDo (drop 4 s) True
    | "don't()" `isPrefixOf` s = filterDo (drop 7 s) False
    | d = [head s] ++ filterDo (tail s) True
    | otherwise = filterDo (tail s) False
        

main ::IO ()
main = do
    input <- readFile "../input.txt"
    print $ sumOfMults $ filterDo input True