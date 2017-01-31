module DeleteNth where
deleteNth :: (Eq a) => Int -> a -> [a] -> [a]

deleteNth n t lst = case lst of
                    (x:xs) -> if x == t && n == 1 then xs
                              else if x == t then x: deleteNth (n-1) t xs
                              else x : deleteNth n t xs
                    [] -> [] 