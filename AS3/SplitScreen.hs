module SplitScreen where

   import WindowLayout

   w1 = Window "name" 10 6
   w2 = Window "bane" 100 12
   hw = Horizontal [w1,w2]
   vw = Vertical [w1,w2]

   splitScreen :: String -> WindowLayout -> WindowLayout
   splitScreen name w1 = case w1 of Window x y z -> matchFound name (Window x y z)
                                    Horizontal xs -> Horizontal (caseHorizontal name xs) 
                                    Vertical xs -> Vertical (caseVertical name xs)

   caseHorizontal :: String -> [WindowLayout] -> [WindowLayout]
   caseHorizontal _ [] = []
   caseHorizontal name (x:xs) = splitScreen name x : caseHorizontal name xs

   caseVertical :: String -> [WindowLayout] -> [WindowLayout]
   caseVertical _ [] = []
   caseVertical name (x:xs) = splitScreen name x : caseVertical name xs




   matchFound :: String -> WindowLayout -> WindowLayout
   matchFound name w1@(Window x y z) =
                              let w = Window x (y`div`2) z
                              in if (compare name x) == EQ
                                 then Horizontal [w,w]
                                 else w1 

