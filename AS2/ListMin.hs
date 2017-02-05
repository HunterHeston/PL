module ListMin where

listMin :: (Ord a) => [a] -> a

listMin (x:[]) = x 
listMin (x:y:xs) = listMin((min x y : xs))
