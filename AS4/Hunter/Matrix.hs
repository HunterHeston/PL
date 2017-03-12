module Matrix (Matrix, fillWith, fromRule, numRows, numColumns,
 at, mtranspose, mmap) where
-- newtype is like “data”, but has some efficiency advantages
newtype Matrix a = Mat ((Int,Int), (Int,Int) -> a)
fillWith :: (Int,Int) -> a -> (Matrix a)

--fromRule :: (Int,Int) -> ((Int,Int) -> a) -> (Matrix a)


--numRows :: (Matrix a) -> Int


--numColumns :: (Matrix a) -> Int


--at :: (Matrix a) -> (Int, Int) -> a


--mtranspose :: (Matrix a) -> (Matrix a)


--mmap :: (a -> b) -> (Matrix a) -> (Matrix b)