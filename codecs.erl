-module(codecs).
-export([int_2_bcd/1]).

int_2_bcd(N) -> 
    % write a coversion from integer to binary coded decimal
    if is_integer(N) ->
        	BCD = integer_to_list(N, 2),
        	Rev_BCD = lists:reverse(BCD),
        	Full_BCD = lists:map(fun(X) -> [X, $0] end, Rev_BCD),
        	list_to_binary(Full_BCD)
    end.
    


