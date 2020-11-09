% ЗАДАНИЕ 1
task1(A, B):-
  A > B, !.
task1(_, B):-
  M is B mod 2, M == 1, writeln(B), fail.
task1(A, B):-
  B1 is B - 1, task1(A, B1).
  
launch_task1:-
  writeln('enter 1st number '), read(A),
  writeln('enter 2nd number '), read(B),
  task1(A, B).
  
% проверка:
% task1(10, 20).
% task1(-6, 5).

% ЗАДАНИЕ 2
fibonacci(Index, Value):-
  Index =< 1, Value is 1, !;
  I1 is Index - 1, I2 is Index - 2,
  fibonacci(I1, V1), fibonacci(I2, V2),
  Value is V1 + V2.
  
task2:-
  repeat,
  writeln('enter index of number Fibonacci '), read(Index),
  (Index < 0, !;
  fibonacci(Index, Value), writeln(Value), fail).
   
% проверка:
% task2.

% ЗАДАНИЕ 3
task3(A, B, [H1|T1], [H1|T2], L2, L3):-
  H1 @< A, !, task3(A, B, T1, T2, L2, L3).
task3(A, B, [H1|T1], L1, [H1|T2], L3):-
  H1 @>= A, H1 @=< B, !, task3(A, B, T1, L1, T2, L3).
task3(A, B, [H1|T1], L1, L2, [H1|T2]):-
  task3(A, B, T1, L1, L2, T2).
task3(_, _, [], [], [], []).

launch_task3:-
  writeln("enter list: "),read(L),is_list(L),
  writeln("enter A: "),read(A),number(A),
  writeln("enter B: "),read(B),number(B),
  (A @> B, task3(B, A, L, L1, L2, L3);
           task3(A, B, L, L1, L2, L3)),
  %task3(A, B, L, L1, L2, L3),
  write('L1: '), writeln(L1),
  write('L2: '), writeln(L2),
  write('L3: '), writeln(L3).

% проверка:
% task3(3, 8, [3,7,1,-3,5,8,0,9,2], L1, L2, L3).
% task3(-2, 5, [5,4,5,6,-12,12,-3,0,21,1], L1, L2, L3).
% task3(0, 11, [0, 11, -11], L1, L2, L3).

% ЗАДАНИЕ 4
% деление списка на две части по числу M:
split(M, [H1|T1], [H1|T2], L2):-
  H1 @< M, !, split(M, T1, T2, L2).
split(M, [H1|T1], L1, [H1|T2]):-
  split(M, T1, L1, T2).
split(_, [], [], []).

% быстрая сортировка:
qsort([], []).
qsort([Elem], [Elem]).
qsort([Head|Tail], Sort_list):-
  split(Head, Tail, Less, More),
  qsort(More, Sort_more),
  qsort(Less, Sort_less),!,
  append(Sort_less, [Head|Sort_more], Sort_list).

% узнать сколько раз (частота, frequency) встречается число:
set_frequency(Input_list, Output_list):-
  set_frequency(Input_list, [], Temp1_list),
  qsort(Temp1_list, Temp2_list),
  reverse(Temp2_list, Output_list).
    
% точка возврата:
set_frequency([], List, List).

% если Num встречено не впервые:
set_frequency([Num | Tail], Temp1_list, Return_list):-
  select([Freq, Num], Temp1_list, Temp2_list),
  Freq1 is Freq + 1, !,
  set_frequency(Tail, [[Freq1, Num] | Temp2_list], Return_list).
  
% если Num встречено впервые:
set_frequency([Num | Tail], Temp0_list, Return_list):-
  set_frequency(Tail, [[1, Num] | Temp0_list], Return_list).
    
% записать в список наиболее встречаемые числа:
max_frequency(Max, [[Freq, Num]|T1], [Num|T2]):-
  Max == Freq, max_frequency(Max, T1, T2).
max_frequency(Max, [[_, _]|T1], Max_list):-
  max_frequency(Max, T1, Max_list).
max_frequency(_, [], []):- !.

% запустить все это:
task4(Input_list, Max_list):-
  set_frequency(Input_list, [[Max_freq, Num]|Tail]),
  max_frequency(Max_freq, [[Max_freq, Num]|Tail], Max_list), !.

launch_task4():-
  writeln("enter list: "),read(L),is_list(L),
  write('Input_list: '), writeln(L),
  task4(L, Max_list),
  write('Max_list: '), writeln(Max_list).
  
% проверка:
% set_frequency([0,3,5,7,1,5,3,0,3,3,5,7,0,5,0], L).
% task4([0,3,5,7,1,5,3,0,3,3,5,7,0,5,0], L).
% task4([2,4,1,4,4,4,2], L).
% task4([-1, 1], L).
