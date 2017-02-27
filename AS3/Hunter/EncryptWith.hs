module EncryptWith where

   import ToCharFun
   import MapInside

   encryptWith :: (Int -> Int) -> [String] -> [String]
   encryptWith f msg = let g = toCharFun f
                       in  mapInside g msg 
