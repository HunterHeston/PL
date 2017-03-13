-- $Id: InfSetTests.hs,v 1.2 2015/02/12 04:23:12 leavens Exp leavens $
module InfSetTests where
import InfSet
import Testing

main = dotests "InfSetTests $Revision: 1.2 $" tests

tests :: [TestCase Bool]
tests =
    [assertTrue (inSet "coke" (fromFunc (\ x -> x == "coke")))
    ,assertFalse (inSet "pepsi" (fromFunc (\ x -> x == "coke")))
    ,assertFalse (inSet "coke" (complementSet (fromFunc (\x -> x == "coke"))))
    ,assertTrue (inSet "oil" (complementSet (fromFunc (\x -> x == "coke"))))
    ,assertTrue (inSet "pepsi" (unionSet (fromFunc (\ x -> x == "coke"))
                                (fromFunc (\ x -> x == "pepsi"))))
    ,assertTrue (inSet "coke" (unionSet (fromFunc (\x -> x == "coke"))
                               (fromFunc (\x -> x == "pepsi"))))
    ,assertFalse (inSet "sprite" (unionSet (fromFunc (\x -> x == "coke"))
                                  (fromFunc (\x -> x == "pepsi"))))
    ,assertFalse (inSet "coke" (intersectSet (fromFunc (\x -> x == "coke"))
                                (fromFunc (\x -> x == "pepsi"))))
    ,assertFalse (inSet "pepsi" (intersectSet (fromFunc (\x -> x == "coke"))
                                (fromFunc (\x -> x == "pepsi"))))
    ,assertTrue (inSet "dr. p" (intersectSet (fromFunc (\x -> "coke" <= x))
                                 (fromFunc (\x -> x <= "pepsi"))))
    ,assertTrue (inSet "pepsi" (intersectSet (fromFunc (\x -> "coke" <= x))
                                (fromFunc (\x -> x <= "pepsi"))))
    ,assertFalse (inSet "beer" (intersectSet (fromFunc (\x -> "coke" <= x))
                                (fromFunc (\x -> x <= "pepsi"))))
    ,assertFalse (inSet "wine" (intersectSet (fromFunc (\x -> "coke" <= x))
                                (fromFunc (\x -> x <= "pepsi"))))
    ,assertTrue (inSet "wine" (unionSet (fromFunc (\x -> "coke" <= x))
                                (fromFunc (\x -> x <= "pepsi"))))
    ]
