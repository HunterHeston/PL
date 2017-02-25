module SplitScreen where

   import WindowLayout

   w1 = Window "name" 2 6
   w2 = Window "bane" 4 12
   hw = Horizontal [w1,w2]
   vw = Vertical [w1,w2]

   splitScreen :: String -> WindowLayout -> WindowLayout
   splitScreen name w1 = case w1 of Window x y z -> matchFound name (Window x y z)
                                    Horizontal xs -> Horizontal (caseHorizontal name xs) 
                                    Vertical xs -> Vertical (caseVertical name xs)

   caseHorizontal :: String -> [WindowLayout] -> [WindowLayout]
   caseHorizontal _ [] = []
   caseHorizontal name xs = splitScreen name (head xs) : caseHorizontal name (tail xs)

   caseVertical :: String -> [WindowLayout] -> [WindowLayout]
   caseVertical _ [] = []
   caseVertical name xs = splitScreen name (head xs) : caseVertical name (tail xs)




   matchFound :: String -> WindowLayout -> WindowLayout
   matchFound name (Window x y z) =
                              let w = Window x y (z`div`2)
                              in if (compare name x) == EQ
                                 then Horizontal [w,w]
                                 else w 

