module SplitScreen where
import WindowLayout
splitScreen :: String -> WindowLayout -> WindowLayout
split :: WindowLayout -> WindowLayout
listSplit :: String -> [WindowLayout] -> [WindowLayout]

splitScreen name w1 = case w1 of
  Window x y z -> if name == wname w1 
                  then (split w1) 
                  else w1 
  Horizontal xs -> Horizontal (listSplit name xs)
  Vertical xs -> Vertical (listSplit name xs)
split w1 = let x = Window {wname = wname w1, width = div (width w1) 2, height = height w1} in Horizontal [x, x]

listSplit _ [] = []
listSplit name (x:xs) = splitScreen name x : listSplit name xs
