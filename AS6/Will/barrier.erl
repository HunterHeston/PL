-module(barrier).
-export([start/1]).

start(Running) ->
	spawn(barrier, server, [Running, []]).

server(Running, IDs) ->
	receive
		{Pid, done} ->
			Pid ! {self(), ok},
			case Running of
				1 ->
					lists:foreach(fun(Id) -> Id ! {self(), continue} end, Pid ++ IDs);
				_ ->
					server(Running-1, Pid ++ IDs)
			end;
		{Pid, how_many_running} ->
			Pid ! {self(), number_running_is, Running},
			server(Running, IDs)
	end.
