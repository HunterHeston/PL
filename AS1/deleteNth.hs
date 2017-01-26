module DeleteNth where
deleteNth :: (Eq a) => Int -> a -> [a] -> [a]
deleteNth n toDelete [] = []
deleteNth n toDelete as =
   if n == 1 && head as == toDelete then tail as 
   else if head as == toDelete then head as :deleteNth (n-1) toDelete (tail as)
   else head as :deleteNth n toDelete (tail as)
