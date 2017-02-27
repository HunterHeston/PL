module ComposeList where

   composeList :: [(a -> a)] -> (a -> a)
   composeList [] = (\x -> x)
   composeList (x:[]) = x
   composeList (x:xs) = x.(composeList xs)

  