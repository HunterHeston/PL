module Hep where

hep :: [String] -> [String]

hep (x : xs : y : ys) = case x of
            "you" -> "u" : hep (xs:y:ys)
            "are" -> "r" : hep (xs:y:ys)
            "your" -> "ur" : hep (xs:y:ys)
            "by" -> if xs == "the" && y == "way"
                    then "btw" : hep ys
                    else x : hep (xs:y:ys)
            "for" -> if (xs == "your") && (y == "information")
                    then "fyi" : hep ys
                    else x : hep (xs:y:ys)
            "boyfriend" -> "bf" : hep (xs:y:ys)
            "girlfriend" -> "gf" : hep (xs:y:ys)
            "be" -> if (xs == "right" && y == "back")
                    then "brb" : hep ys
                    else x : hep (xs:y:ys)
            "laughing" -> if (xs == "out" && y == "loud")
                    then "lol" : hep ys
                    else x : hep (xs:y:ys)
            "see" -> if xs == "you"
                    then "cya" : hep (y:ys)
                    else x : hep (xs:y:ys)
            "I" -> if xs == "will"
                    then "I'll" : hep (y:ys)
                    else x : hep (xs:y:ys)
            "great" -> "gr8" : hep (xs:y:ys)
            _ -> x : hep (xs:y:ys)

hep (x: xs: y) = case x of
        "you" -> "u" : hep (xs:y)
        "are" -> "r" : hep (xs:y)
        "your" -> "ur" : hep (xs:y)
        "boyfriend" -> "bf" : hep(xs:y)
        "girlfriend" -> "gf" : hep(xs:y)
        "see" -> if xs == "you"
                 then "cya" : hep(y)
                 else x: hep(xs:y)
        "I" ->   if xs == "will"
                 then "I'll" : hep(y)
                 else x:hep(xs:y)
        "great" -> "gr8" : hep (xs:y)
        _ -> x : hep(xs:y)

hep(x :xs) = case x of
        "you" -> "u" : hep (xs)
        "are" -> "r" : hep (xs)
        "your" -> "ur" : hep (xs)
        "boyfriend" -> "bf" : hep(xs)
        "girlfriend" -> "gf" : hep(xs)
        "great" -> "gr8" : hep (xs)
        _ -> x : hep(xs)


hep [] = []