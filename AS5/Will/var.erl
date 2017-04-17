-module(var).
-export([start/1]).

start(Value) ->
	spawn(server(Value)).

server(Value) ->
	receive
		{assign, NewVal} ->
			server(NewVal);
		{Pid, fetch} ->
			Pid ! {value, Value},
			server(Value)		
	end.
