module ApplyToList where
import BinaryRelation
applyRel :: (Eq k) => k -> (BinaryRelation k v) -> [v]
applyToList :: (Eq k) => [k] -> (BinaryRelation k v) -> [v]

applyRel ky pairs = [snd x | x <- pairs, ky == fst x]

applyToList [] _ = []
applyToList keys pairs = applyRel (head keys) pairs ++ applyToList (tail keys) pairs