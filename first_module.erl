-module(first_module).

-export([first_fun/1, loop/1, collect_val/1, rev/1, check_fortyTwo/1, list_iter/1, filter_long_words/2]).
% -record(merchandise, {name , price, quantity}).

first_fun(X) ->
  2 + X * X.

loop(0) ->
  done;
loop(X) ->
  io:format("~w~n", [X]),
  loop(X - 1). % this is a last call optimisation.

rev(L) ->
  rev(L, []).

rev([H | T], Reversed) ->
  %H1=2*H,
  %io:format("~w~n",[H|Reversed]),
  rev(T, [H | Reversed]);
rev([], Rev) ->
  Rev.

collect_val(N) ->
  collect_val(N, []).

collect_val(0, List) ->
  rev(List);
collect_val(N, List) ->
  {_, [Val_user]} = io:fread("Tell me value:", "~d"),
  collect_val(N - 1, [Val_user | List]).

check_fortyTwo(N) ->
  check_fortyTwo(N, []).

check_fortyTwo(0, List) ->
  rev(List);
check_fortyTwo(N, List) ->
  {_, [Val_user]} = io:fread("Tell me value:", "~d"),
  case Val_user of
    42 ->
      % check_fortyTwo(0, List);
      list_iter(List);
    _ ->
      check_fortyTwo(N - 1, [Val_user | List])
  end.

list_iter([]) ->
  ok;
list_iter([H | T]) ->
  io:format("~p~n", [H]),
  list_iter(T).


% store_init() ->
% 	Apples = #merchandise{name=apple, price=2.49, quantity=100},
%   Bananas = #merchandise{name=banana, price=3.99, quantity=50},
%   Oranges = #merchandise{name=orange, price=4.05, quantity=200},
% 	[Apples, Bananas, Oranges].

% show_item(List) ->
% 	list_iter(List).

% add_item(#merchandise{name = Name, price = Price, quantity = Quantity}, List) -> 
% 	if List == [] ->
% 		[#merchandise{name = Name, price = Price, quantity = Quantity}];
% 	true ->
% 		case Name of apple ->
% 			{Verdict, Name, Quantity} = find_item(List, apple),
% 				if Verdict == found ->
% 					update_quantity(apple, List, Quantity);
% 				true ->
% 					ok
% 				end
% 			end
% 				case Name of banana ->
% 					{Verdict, Name, Quantity} = find_item(List, apple),
% 						if Verdict == found ->
% 							update_quantity(apple, List, Quantity);
% 						true ->
% 							ok
% 						end
% 					end
% 						case Name of orange ->
% 							{Verdict, Name, Quantity} = find_item(List, apple),
% 								if Verdict == found ->
% 									update_quantity(apple, List, Quantity);
% 								true ->
% 									ok
% 								end
% 							end
% 		lists:append(List, [#merchandise{name = Name, price = Price, quantity = Quantity}]) 
% 	end.

% update_quantity



% find_item([], Atom) ->
% 	{not_found, _, _};
% find_item([#merchandise{name=Name, quantity = Quantity} | T]) ->
% 	if Name == Atom -> 
% 		{found, Name, Quantity};
% 	true -> 
%     find_item(T, Name)
%   end.

% find_item(List, Name) ->
% 	[N, N <-List, ].

filter_long_words(List, Length) -> 
	lists:filter(fun(X) -> length(X) > Length end, List).