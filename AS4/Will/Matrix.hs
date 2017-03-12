-- $Id: Matrix.hs,v 1.2 2015/02/12 03:40:09 leavens Exp $
module Matrix (Matrix, fillWith, fromRule, numRows, numColumns, 
               at, mtranspose, mmap) where

-- newtype is like "data", but has some efficiency advantages
newtype Matrix a = Mat ((Int,Int),(Int,Int) -> a)

fillWith :: (Int,Int) -> a -> (Matrix a)
fromRule :: (Int,Int) -> ((Int,Int) -> a) -> (Matrix a)
numRows :: (Matrix a) -> Int
numColumns :: (Matrix a) -> Int
at :: (Matrix a) -> (Int, Int) -> a
mtranspose :: (Matrix a) -> (Matrix a)
mmap :: (a -> b) -> (Matrix a) -> (Matrix b)

-- Without changing what is above, implement the above functions.

fillWith (m, n) e = Mat ((m, n), (\(_,_) -> e))
fromRule (m, n) g = Mat ((m, n), g)
numRows (Mat ((m,_),_)) = m
numColumns (Mat ((_,n),_)) = n
at (Mat ((_,_),g)) (i,j) = g (i,j)
mtranspose (Mat ((m,n),f)) = (Mat ((n,m),(\(j,i)-> f(i,j))))
mmap f (Mat ((m,n),g)) = (Mat ((m,n),f.g))
