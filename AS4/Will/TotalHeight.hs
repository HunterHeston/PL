module TotalHeight where
import WindowLayout
import FoldWindowLayout
totalHeight :: WindowLayout -> Int

totalHeight w = foldWindowLayout (\(s,w1,h) -> h) (\a -> foldr max 0 a) (\a -> foldr (+) 0 a) w
