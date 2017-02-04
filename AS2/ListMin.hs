module ListMin where
listMin :: (Ord a) => [a] -> a

listMin (a:[]) = a
listMin lst = listMin ((min (head lst) (head (tail lst))) : (tail (tail lst)))
