module TotalHeight where
import WindowLayout
totalHeight :: WindowLayout -> Int
verticalHeight :: [WindowLayout] -> Int
horizontalHeight :: [WindowLayout] -> Int

totalHeight w1 = case w1 of 
  Window x y z -> height w1
  Horizontal xs -> horizontalHeight xs
  Vertical xs -> verticalHeight xs
horizontalHeight [] = 0
horizontalHeight (x: xs) = max (totalHeight x) (horizontalHeight xs)
verticalHeight [] = 0
verticalHeight (x:xs) = (totalHeight x) + (verticalHeight xs)


