module Add10List where
add10_list_comp :: [Integer] -> [Integer]
add10_list_comp xs = [x + 10 | x <- xs]
add10_list_rec :: [Integer] -> [Integer]
add10_list_rec [] = []
add10_list_rec xs = head xs + 10 : add10_list_rec (tail xs)
