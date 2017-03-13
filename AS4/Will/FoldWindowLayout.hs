module FoldWindowLayout where
import WindowLayout
foldWindowLayout :: ((String, Int, Int) -> r) -> ([r] -> r) -> ([r] -> r) -> WindowLayout -> r

foldWindowLayout wf hf vf l = case l of
  Window s i1 i2 -> wf (s, i1, i2)
  Horizontal xs -> hf (map (foldWindowLayout wf hf vf) xs)
  Vertical xs -> vf (map (foldWindowLayout wf hf vf) xs)
