-module(electionserver).
-export ([start/0, eserver/1, vote/2, results/1]).

-spec start() -> pid().
-spec vote(ES::pid(), Candidate::atom()) -> ok.
-spec results(ES::pid()) -> [{atom(), non_neg_integer()}].

start() ->
   spawn(electionserver, eserver, [[]]).


eserver(Lst) ->
   receive
      {Pid, request_votes} ->
         Pid!Lst,
         eserver(Lst);
      {Candidate,1} ->
         io:format("server received ~w~n", [Candidate]),
         case lists:keyfind(Candidate, 1, Lst) of
            {Candidate, N} ->
               Nlist = lists:keyreplace(Candidate, 1, Lst, {Candidate, N+1}),
               eserver(Nlist);
            false -> 
               eserver([{Candidate,1}|Lst])
         end
   end.

vote(ES, Candidate)->
   ES!{Candidate, 1},
   ok.

results(ES) ->
   ES!{self(), request_votes},
   receive
      Lst -> lists:sort(Lst)
   end.

helper(Lst) ->
   case Lst of
      [] -> [];
      [H|T] -> io:format("results received ~w~n", [H]), helper(T) 
   end.
   
  %[] -> [];
  %[H|T] -> io:format("results received ~w~n", [H]), helper(T) 