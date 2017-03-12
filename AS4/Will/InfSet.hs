-- $Id: InfSet.hs,v 1.1 2015/02/12 04:17:59 leavens Exp leavens $
module InfSet where

fromFunc :: (a -> Bool) -> (Set a)
unionSet :: Set a -> Set a -> Set a
intersectSet :: Set a -> Set a -> Set a
inSet :: a -> Set a -> Bool
complementSet :: Set a -> Set a

-- define the type (Set a) as one of the following and then...

type Set a = -- ...
-- or perhaps something like --
data Set a = -- ...

-- Write your code below for the operations declared above...
