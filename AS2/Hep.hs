module Hep where
hep :: [String] -> [String]

hep [] = []
hep ("by":"the":"way":txt) = "btw" :hep txt
hep ("for":"your":"information":txt) = "fyi" :hep txt
hep ("be":"right":"back":txt) = "brb" :hep txt
hep ("laughing":"out":"loud":txt) = "lol" :hep txt
hep ("see":"you":txt) = "cya" :hep txt
hep ("I":"will":txt) = "I'll" :hep txt
hep txt = 
  let x = head txt in
  let t = tail txt in
  (if x == "you" then "u" 
  else if x == "are" then "r"
  else if x == "your" then "ur"
  else if x == "boyfriend" then "bf"
  else if x == "girlfriend" then "gf"
  else if x == "great" then "gr8"
  else x): hep t
