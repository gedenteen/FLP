parent(john, bob).
parent(mary, bob).
parent(mary, anne).
parent(bob, lisa).
parent(bob, paul).
parent(bob, sam).
parent(paul, pat).

male(john).
male(bob).
male(paul).
male(sam).
male(pat).

female(mary).
female(anne).
female(lisa).

father(X, Y):- male(X), parent(X, Y).
mother(X, Y):- female(X), parent(X, Y).
brother(X, Y):- male(X), parent(Z, X), parent(Z, Y), X \== Y.
sister(X, Y):- female(X), parent(Z, X), parent(Z, Y), X \== Y.
grandchild(X, Y):- parent(Z, Y), parent(X, Z).
aunt(X, Y):- parent(Z, Y), sister(X, Z).
%twochildren(X):-setof(Y,parent(X,Y),L),length(L,N),N=:=2.
twochildren(X):-
    parent(X,Y),
    parent(X,Z), Y@>Z,
    not((parent(X,W), W\=Y, W\=Z)).
successor(X, Y):- parent(X, Y), male(Y).