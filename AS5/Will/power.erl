-module(power).
-export([start/0]).

start() ->
	spawn(fun server/0).

server() ->
	receive
	{Pid, power, N, M} ->
		Pid ! {answer, math:pow(N, M)}
	end,
	server().
