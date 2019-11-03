man(vasya).
man(ivan).
man(sasha).
man(misha).
man(kirill).
woman(dasha).
woman(anna).
woman(marya).
woman(ira).
child(vasya, marya).
child(vasya, ivan).
child(ira, marya).
child(ira, ivan).
child(ivan, sasha).
child(ivan, anna).
child(marya, misha).
child(marya, anna).
child(dasha,sasha).
child(kirill,misha).

mother(X,Y):-child(X, Y), woman(Y). 
father(X,Y):-child(X, Y), man(Y).
grandmother(X,Y):-child(X,Z), child(Z,Y), woman(Y).
grandfather(X,Y):-child(X,Z), child(Z,Y), man(Y).
sibling(X,Y):-child(X,Z), child(Y,Z), man(Z), child(X,A), child(Y,A), woman(A), X\==Y.
monomather(X,Y):-child(X,Z), child(Y,Z), woman(Z), child(X,A), child(Y,B), A\==B, man(A), man(B).
monofather(X,Y):-child(X,Z), child(Y,Z), man(Z), child(X,A), child(Y,B), A\==B, woman(A), woman(B).
anysibling(X,Y):-child(X,Z), child(Y,Z), X\==Y.
ancestor(X,Y):-child(X,Y); child(X,Z), ancestor(Z,Y).
heir(Y,X):-child(X,Y); child(X,Z), heir(Y,Z).
progenitor(X):-child(_,X),\+child(X,_).
pprogenitor(X,Y):-((child(X,Z), pprogenitor(Z,Y));\+child(Y,_)), child(X,Y).
rel(X,Y):-ancestor(X,Z),ancestor(Y,Z).
