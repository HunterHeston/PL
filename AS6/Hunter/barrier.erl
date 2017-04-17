-module(barrier).
-export([start/1, server/3]).

start(N) ->
    spawn(barrier, server, [N,N,[]]).


server(N, M, Ids) ->
   case M of
      0 -> 
         helper(self(), N, Ids),
         receive
            {Pid, how_many_running} ->
               Pid!{self(), number_running_is, M},
               server(N, M, Ids)
         end;
      _ ->
         receive
            {Pid, done} -> 
               Pid!{self(), ok},
               server(N, M-1, [Pid|Ids]);
            {Pid, how_many_running} ->
               Pid!{self(), number_running_is, M},
               server(N, M, Ids)
         end
   end.


   



helper(_, N, []) ->
   done;
helper(SPid, N, [H|T]) ->
   H!{SPid, continue},
   helper(SPid, N, T).