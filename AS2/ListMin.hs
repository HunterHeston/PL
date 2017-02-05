module ListMin where
<<<<<<< HEAD

listMin :: (Ord a) => [a] -> a

listMin (x:[]) = x 
listMin (x:y:xs) = listMin((min x y : xs))
=======
listMin :: (Ord a) => [a] -> a

listMin (a:[]) = a
listMin lst = listMin ((min (head lst) (head (tail lst))) : (tail (tail lst)))
>>>>>>> e88d63122abefd95b37996d1b01052eb54b85914
