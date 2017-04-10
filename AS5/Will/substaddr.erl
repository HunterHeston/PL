-module(substaddr).
-export([substaddr/3]).
-include("salesdata.hrl").
-import(salesdata, [store/2, group/2]).
-spec substaddr(salesdata:salesdata(), string(), string()) -> salesdata:salesdata().

substaddr(SD, New, Old) -> 
	case SD of
		#store{address=Old, amounts=X} ->
			#store{address=New, amounts=X};
		#group{gname=Y, members=X} ->
			#group{gname=Y, members=helper(X, New, Old)};
		_ ->
			SD
	end.
helper(LS, New, Old) -> 
	case LS of
		[] ->
			[];
		_ ->
			[substaddr(hd(LS), New, Old)] ++ helper(tl(LS), New, Old)
	end.
