module TotalHeight where

   import WindowLayout

   w1 = Window "name" 2 6
   w2 = Window "bane" 4 12
   hw = Horizontal [w1,w2]
   vw = Vertical [w1,w2]


   totalHeight :: WindowLayout -> Int

   totalHeight w1 = case w1 of Window x y z -> height w1
                               Horizontal xs -> maxWidths xs
                               Vertical xs -> sumHeights xs

   sumHeights :: [WindowLayout] -> Int
   sumHeights [] = 0
   sumHeights ( (Window x y z) :xs) =  z + (sumHeights xs)

   maxWidths :: [WindowLayout] -> Int
   maxWidths [] = 0
   maxWidths [x] = width x
   maxWidths ( (Window x y z) :xs) = max y (maxWidths xs)     