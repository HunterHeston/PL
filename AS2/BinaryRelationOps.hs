module BinaryRelationOps where
import BinaryRelation
project1 :: (BinaryRelation a b) -> [a]
project2 :: (BinaryRelation a b) -> [b]
select :: ((a,b) -> Bool) -> (BinaryRelation a b) -> (BinaryRelation a b)
compose :: Eq b => (BinaryRelation a b) -> (BinaryRelation b c) -> (BinaryRelation a c)

project1 rels = [fst x | x <- rels]
project2 rels = [snd x | x <- rels]
select pred rel = rel
compose rel1 rel2 = [(fst x, snd y)| x <- rel1, y <- rel2, snd x == fst y ]