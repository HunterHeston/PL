-module(typeError).
-export([error/0]).


error() ->
   3 + "hello".
