module Rank where
import Data.List
rank :: (Ord a) => [a] -> [(Int, a)]
helper :: (Ord a) => Int -> Int -> [a] -> [(Int, a)]

rank things = helper 1 1 (sort things)
helper _ _ [] = []
helper _ num (x:[]) = [(num, x)]
helper depth num (x:y:xs) = let z = (num, x) in 
  if x == y 
  then z: (helper (depth + 1) num (y:xs)) 
  else z: (helper (depth + 1) (depth + 1) (y:xs))
