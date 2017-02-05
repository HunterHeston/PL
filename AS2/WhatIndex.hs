module WhatIndex where
whatIndex :: (Eq a) => a -> [a] -> Integer
helper :: (Eq a) => Integer -> a -> [a] -> Integer

whatIndex sought [] = -1
whatIndex sought lst = if sought == (head lst) then 0 else helper 1 sought (tail lst)
helper num sought [] = -1
helper num sought lst = if sought == (head lst) then num else helper (num+1) sought (tail lst)
