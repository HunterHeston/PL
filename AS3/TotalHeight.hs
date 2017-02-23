module TotalHeight where

   import WindowLayout

   totalHeight :: WindowLayout -> Int

   totalHeight w1 = case w1 of Window x y z -> height w1
                               Horizontal xs -> maxWidths xs
                               Vertical xs -> sumHeights xs

   sumHeights :: [WindowLayout] -> Int
   sumHeights [] = 0
   sumHeights xs = height (head xs) + sumHeights (tail xs)

   maxWidths :: [WindowLayout] -> Int
   maxWidths [] = 0
   maxWidths xs = max (width (head xs) ) (maxWidths (tail xs))     