-- $Id: MatrixAdd.hs,v 1.1 2013/09/24 14:54:21 leavens Exp $
module MatrixAdd where
import Matrix
import MatrixInstances

sameShape :: (Matrix a) -> (Matrix a) -> Bool
pointwiseApply :: (a -> a -> b) -> (Matrix a) -> (Matrix a) -> (Matrix b)
add :: (Num a) => (Matrix a) -> (Matrix a) -> (Matrix a)
sub :: (Num a) => (Matrix a) -> (Matrix a) -> (Matrix a)

-- without changing the above, implement the declared functions.

sameShape m1 m2 = numRows m1 == numRows m2 && numColumns m1 == numColumns m2
pointwiseApply op m1 m2 
  | sameShape m1 m2 = fromRule (numRows m1, numColumns m1) (\(i,j)->(m1 `at` (i,j)) `op` (m2 `at` (i,j)))
  | otherwise = error "Matrices are not the same shape"
add m1 m2 = pointwiseApply (\a1 a2 -> a1 + a2) m1 m2
sub m1 m2 = pointwiseApply (\a1 a2 -> a1 - a2) m1 m2
