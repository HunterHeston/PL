module Rank where

   rank :: (Ord a) => [a] -> [(Int, a)]
   rank xs = setRanks (sort xs) 1 


   setRanks :: (Ord a) => [a] -> Int -> [(Int, a)]
   setRanks [] _  = []
   setRanks [x] rank = [(rank,x)] 
   setRanks (x:xs) rank = if x == (head xs)
                          then (rank, x) : (tie xs rank 1)
                          else (rank, x) : (setRanks xs (rank+1))


   tie :: (Ord a) => [a] -> Int -> Int -> [(Int, a)]
   tie [] _ _ = []
   tie (x:[]) rank tieCount = [(rank, x)]
   tie (x:xs) rank tieCount = if x == (head xs)
                              then (rank, x) : (tie xs rank (tieCount+1) )
                              else (rank, x) : (setRanks xs (rank + tieCount + 1))


   sort :: (Ord a) => [a] -> [a]
   sort [] = []
   sort (x:xs) = 
         let less = sort [a | a <- xs, a <= x]
             more = sort [a | a <- xs, a > x]
         in  less ++ [x] ++ more 