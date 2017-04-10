-module(var).
-export([start/1]).

start(Value) ->
	spawn(fun server/1(Value)).

server(Value) ->
	receive
		{assign, NewVal} ->
			server(NewVal);
		{Pid, fetch} ->
			Pid ! {value, Value},
			server(Value)		
	end.
