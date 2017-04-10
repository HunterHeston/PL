-module(concat).
-export([concat/1]).
-spec concat(Lists :: [[T]]) -> [T].

concat([]) -> [];
concat(XS) -> hd(XS) ++ concat(tl(XS)).
