module DeleteNth where
deleteNth :: (Eq a) => Int -> a -> [a] -> [a]
deleteNth n toDelete [] = []
deleteNth n toDelete as =
   let h = head as
       t = tail as
   in if n == 1 && h == toDelete then t 
   else if h == toDelete then h :deleteNth (n-1) toDelete t
   else h :deleteNth n toDelete t