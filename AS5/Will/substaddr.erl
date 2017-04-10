-module(substaddr).
-export([substaddr/3]).
-include("salesdata.hrl").
-import(salesdata, [store/2, group/2]).
-spec substaddr(salesdata:salesdata(), string(), string()) -> salesdata:salesdata().

substaddr(SD, New, Old) -> 
	case SD of
		{store, {Old, X}} ->
			{store, {New, X}};
		{group, {Y, X}} ->
			{group, {Y, lists:map(fun substaddr/3(New, Old), X)}};
		_ ->
			SD
	end. 
