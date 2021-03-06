% ������� 1.16
task1([Head1|Tail1], X, Y, [X,Head1|Tail2]):-
    Head1 == Y, !, task1(Tail1, X, Y, Tail2).
task1([Head1|Tail1], X, Y, [Head1|Tail2]):-
    task1(Tail1, X, Y, Tail2).
task1([], _, _, []).

% task1([1,2,1,5,8,1,0], 5, 1, List). % ��������� ��-�� �� ���������
% task1([1,5,8,1,0], 5, 1, List). % � ����� ���������
% task1([5,4,3,2,1], 3, 12, List).

% ������� 2.16
task2():-
    open('E:\\programming\\FLP\\rgz\\in.txt', read, F),
    set_input(F), read_stream_to_codes(F, List), close(F),
    isolate_nl(List, NewList), % �������� nl ��� ��������� �����
    N is 0, TempMaxN is 0, find_max_length(NewList, N, TempMaxN, MaxN),
    !, write('max length = '), writeln(MaxN),
    codes_to_words(NewList, Words), %write(Words),
    tell('E:\\programming\\FLP\\rgz\\out.txt'),
    write_to_file(Words, MaxN), told.

% ��������� ������� �������� ������ ���������:
isolate_nl([Head|Tail1], [Head|Tail2]):-
    Head \== 10, !, isolate_nl(Tail1, Tail2).
isolate_nl([10|Tail1], [32,10,32|Tail2]):-
    isolate_nl(Tail1, Tail2).
isolate_nl([], []).

% ����� ����� ������ �������� �����:
find_max_length([Head|Tail], N, MaxN, Ans):-
    Head \== 32, Head \== 10, !, N1 is N + 1,
    find_max_length(Tail, N1, MaxN, Ans).
find_max_length([_|Tail], N, MaxN, Ans):-
    (N @> MaxN, MaxN1 is N;
    MaxN1 is MaxN),
    N1 is 0, find_max_length(Tail, N1, MaxN1, Ans).
find_max_length([], N, MaxN, Ans):-
    (N @> MaxN, Ans is N; % ��������� ����� ����� ���� ������������
    Ans is MaxN), !.

% ������ ������� ����� ������:
get_spaces([Head|Tail], [Head|TailSpaces], TailString):-
    Head == 32, !, get_spaces(Tail, TailSpaces, TailString).
get_spaces(List, [], List).

% �������� �����:
get_word([Head|Tail], [Head|TailSpaces], TailString):-
    Head \== 32, !, get_word(Tail, TailSpaces, TailString).
get_word(List, [], List).

% �������� ������ ����� �� ������ (� ������ ����� ���� �������)
read_word(String, Word, Tail):-
    get_spaces(String, _, StringWithoutSpaces), % ������� �������
    get_word(StringWithoutSpaces, Word, Tail),
    Word \== [].

% ������������� ���� �������� � �����:
codes_to_words(String, [Word|ListTail]):-
    read_word(String, Word, StringTail), !,
    codes_to_words(StringTail, ListTail).
codes_to_words(_, []).
    
%������ ���� � ����:
write_to_file([Head|Tail], Ans):-
    length(Head, LenHead), LenHead == Ans, !, write_to_file(Tail, Ans).
write_to_file([Head|Tail], Ans):-
    string_to_list(S,Head), write(S),
    check_nl(Head),
    write_to_file(Tail, Ans).
write_to_file([], _).

%���� ����� - �� ������� ������, �� �������� ����� ���� ������:
check_nl([Head|_]):-
    Head \== 10, !, write(' ').
check_nl(_).