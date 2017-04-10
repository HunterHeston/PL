-module(count_matching).
-export([count_matching/2]).
-spec count_matching (fun((T) -> boolean()), list(T)) -> non_neg_integer().

count_matching(_, []) -> 0;
count_matching(Pred, Lst) -> 
	case Pred(hd(Lst)) of
		true -> 1 + count_matching(Pred, tl(Lst));
		false -> count_matching(Pred, tl(Lst))
	end.
