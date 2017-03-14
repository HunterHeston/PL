module SplitScreen where
import WindowLayout
import FoldWindowLayout
splitScreen :: String -> WindowLayout -> WindowLayout
split :: String -> WindowLayout -> WindowLayout

splitScreen name w1 = foldWindowLayout (\(s,w,h) -> split name w1) (\w -> Horizontal (map (split name) w)) (\w -> Vertical (map (split name) w)) w1

split name w1 = case w1 of 
  Window n w h -> if n == name 
                  then Horizontal (let x = Window {wname = name, width = div w 2, height = h} in [x, x])
                  else w1
  _ -> w1
