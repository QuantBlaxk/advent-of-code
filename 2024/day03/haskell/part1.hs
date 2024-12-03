import Data.Char (isDigit)
import Data.List (isPrefixOf)

sumOfMults :: String -> Int
sumOfMults [] = 0
sumOfMults s
    | "mul(" `isPrefixOf` s =
        let (n1, r1) = span isDigit $ drop 4 s; (n2, r2) = span isDigit (drop 1 r1)
        in if not (null n1) && not (null n2) && r2 /= "" && head r2 == ')'
            then read n1 * read n2 + sumOfMults (tail r1)
            else sumOfMults (tail s)
    | otherwise = sumOfMults (tail s)


main ::IO ()
main = do
    input <- readFile "../input.txt"
    print $ sumOfMults input