module MapInside where

   mapInside :: (a -> b) -> [[a]] ->[[b]]
   mapInside _ [] = []
   mapInside f (x:xs) = map f x : mapInside f xs
   