% parsing/parse.pl

parse(X) :- lines(X, []).

lines(Input, Remaining) :-
    line(Input, RestAfterLine),
    (   RestAfterLine = [';' | RestAfterSemi],
        lines(RestAfterSemi, Remaining)
    ;   Remaining = RestAfterLine
    ).

line(Input, Remaining) :-
    num(Input, RestAfterNum),
    (   RestAfterNum = [',' | RestAfterComma],
        line(RestAfterComma, Remaining)
    ;   Remaining = RestAfterNum
    ).

num(Input, Rem) :- digits(Input, Rem).

digits([D|T], Rem) :-
    digit(D),
    (   digits(T, Rem)
    ;   Rem = T
    ).

digits([], []).

digit(D) :- member(D, ['0','1','2','3','4','5','6','7','8','9']).