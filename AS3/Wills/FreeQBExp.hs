module FreeQBExp where
import QBExp
freeQBExp :: QBExp -> [String]
helper :: [String] -> QBExp -> [String]

freeQBExp qbe = helper [] qbe
helper noadd qbe = case qbe of
  (Varref s) -> if s `elem` noadd then [] else [s]
  (Not e) -> (helper noadd e)
  (e1 `Or` e2) -> let x = (helper noadd e1) in x ++ (helper (noadd ++ x) e2)
  (Exists x e) -> helper (noadd ++ [x]) e
