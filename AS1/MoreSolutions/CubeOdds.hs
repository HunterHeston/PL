module CubeOdds where
cubeOdds :: [Integer] -> [Integer]


cubeOdds lst = case lst of 
                (x:xs) -> if odd x then x^3 : cubeOdds (xs) else x: cubeOdds (xs)
                [] -> []