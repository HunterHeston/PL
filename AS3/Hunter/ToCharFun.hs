module ToCharFun where

   toCharFun :: (Int -> Int) -> (Char -> Char)
   toCharFun f =  (\c -> toEnum  ( f (fromEnum (c :: Char)) ) :: Char)