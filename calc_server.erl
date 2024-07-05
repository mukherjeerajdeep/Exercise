-module(calc_server).
-export([math/0]).

math() ->
    io:format("Process started"),
    receive
        % {Pid,Msg} ->
        %     io:format("I ve get: ~w ~n",[Msg]),
        %     Pid ! "Than you for message!";     
        {Pid,List} when is_list(List)->
            [Num1, Num2, Sign] = List,
            io:format("I received: ~p ~p ~p ~n",[Num1, Num2, Sign]),
            case Sign of
                '+' ->
                    Result = Num1 + Num2;
                '-' ->
                    Result = Num1 - Num2;
                '*' ->
                    Result = Num1 * Num2;
                '/' ->
                    Result = Num1 / Num2
                end,            
            Pid ! {"Result ~p", Result};
        Mesg->
            io:format("I ve get: ~w ~n",[Mesg])
    end,
math().