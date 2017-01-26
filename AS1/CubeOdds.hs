module CubeOdds where
cubeOdds :: [Integer] -> [Integer]
cubeOdds lst = [if odd x then x*x*x else x | x <- lst]
