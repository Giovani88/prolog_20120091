giobot:-	writeln('Hola , mi nombre es Giobot tu chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	giobot(Input),!.
giobot(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
giobot(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
giobot(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	giobot(Input1), !.

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], ['Por que', tu, 0,eres,yo,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% 5 saludos extra
template([que, tal,yo,soy, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).

% SE
%template([tengo,la,enfermedad,de,s(_),que,medicamento,debo,tomar,'.'], ['Hola',0,'asies'], [3]).
template([tengo,la,enfermedad,de,s(_),que,medicamento,debo,tomar,'.'], [flagMedicamento], [4]).
template([tengo,el,sintoma,de,s(_),que,medicamento,debo,tomar,'.'], [flagReceta], [4]).
template([tengo,s(_),que,especialista,me,puede,atender,'.'], [flagEspecialista], [1]).
template([tengo,la,enfermedad,de,s(_),que,especialista,y,medicina,necesito,'.'], [flagDiagnostico], [4]).

% pregunta algo que le gusta a giobot
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% pregunta algo que hace giobot
template([tu, eres, s(_), _], [flagDo], [2]).
template([tu, puedes, s(_), _], [flagDo], [2]).
% pregunta algo que es giobot
template([que, eres, tu, s(_)], [flagIs], [3]).
template([eres, s(_), '?'], [flagIs], [1]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).




				  
template(_, ['Porfavor', se, mas, especifico, '.'], []). 
% Lo que le gusta a giobot : flagLike 
giobotLikes(X, R):- likes(X), R = ['Si', me, gustan, X].
giobotLikes(X, R):- \+likes(X), R = ['No',no,me,gustan, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
likes(carros).



% lo que hace giobot: flagDo
giobotDoes(X, R):- does(X), R = ['Si', puedo, X, y, amo, hacerlo].
giobotDoes(X, R):- \+does(X), R = ['No',no,puedo, X ,'.', eso, es,muy,dificil,para,mi].
does(estudiar).
does(cocinar).
does(trabajar).

% lo que es giobot: flagIs
giobotIs(X, R):- is0(X), R = ['Si', yo, soy, X].
giobotIs(X, R):- \+is0(X), R = ['No', no,soy, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).
is0(feliz).

% ** SE **
% medicamento a tomar:
medicamento(X, R):- medicinade(Y,X), R=['Deberias',tomar,Y].
medicamento(X, R):- \+medicinade(Y,X), R=['Lo siento',no,conozco,el,medicamento, que,debes,tomar,para,X].

% medicamento a tomar por sintoma
receta(X,R):-sintomade(X, Z),medicinade(M, Z), R=['Deberias',tomar,M,para,el,sintoma,X].
receta(X,R):- \+sintomade(X, Z),medicinade(M, Z), R=['Lo siento no conozco el medicamento para el sintoma de',X].

% especialista por enfermedad
especialista(X,R):- especialistade(M,X),R=['Especialista',M].
especialista(X,R):- \+especialistade(M,X),R=['Lo siento, no conozco el especialista para',X].

% que especialista atiende y que medicina receta por enfermedad x
diagnostico(E, R):- mereceta(Es,M,E), R=[Es,M].


mereceta(Es, M, E):-medicinade(M, E),sintomade(S, E), atiendeespecialista(Es,S).
atiendeespecialista(E, S):- sintomade(S,Z),especialistade(E, Z).

medicinade(contrex, gripe). %contrex es medicamento de la gripe
medicinade(jarabe, gripe). %jarabe es medicamento de la gripe
medicinade(pastillas, tubercolosis). %pastillas es medicamento de la tubercolosis
medicinade(vacuna, malaria). %vacuna es medicamento de la malaria
medicinade(vacuna, rubeola). %vacuna es medicamento de la rubeola
medicinade(vitaminas, anemia). %vitaminas es medicamento de la anemia
medicinade(pastillas, hepatitis). %pastillas es medicamento de hepatitis

enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).

sintomade(tos, gripe). %la tos es síntoma de gripe
sintomade(cansancio, gripe). %el cansancio es síntoma de gripe
sintomade(fiebre, gripe). %la fiebre es síntoma de gripe
sintomade(dolorcabeza, gripe). %dolor de cabeza es síntoma de gripe
sintomade(nausea, hepatitis). %las nauseas son síntoma de hepatitis
sintomade(diarrea, hepatitis). %la diarrea es síntoma de hepatitis
sintomade(ictericia, hepatitis). %la ictericia es síntoma de hepatitis
sintomade(cansancio, anemia). %cansancio es síntoma de anemia
sintomade(apatia, anemia). %apatía es síntoma de anemia
sintomade(nausea, anemia). %las nauseas son síntomas de anemia
sintomade(tos, tuberculosis). %la tos es síntoma de la tuberculosis
sintomade(cansancio, tuberculosis). %el cansancio es síntoma de tuberculosis
sintomade(fiebre, tuberculosis). %la fiebre es síntoma de la tuberculosis
sintomade(escalofrios, tuberculosis). %los escalofríos es síntoma de tuberculosis
sintomade(escalofrios, malaria). %los escalofríos son síntomas de la malaria
sintomade(fiebre , malaria). %la fiebre es síntoma de malaria
sintomade(diarrea , malaria). %la diarrea es síntoma de malaria
sintomade(ictericia, malaria). %la ictericia es síntoma de malaria
sintomade(fiebre, rubeola). %la fiebre es síntoma de rubeola
sintomade(jaqueca, rubeola). %la jaqueca es síntoma de rubeola
sintomade(secrecion, rubeola). %la secreción es síntoma de rubeola

especialistade(otorrino, gripe).
especialistade(nutricionista, anemia).
especialistade(endocrinologia, hepatitis).
especialistade(medicinageneral, rubeola).
especialistade(nutricionista, tubercolosis).
especialistade(medicinageneral, malaria).




match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% giobot likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	giobotLikes(Atom, R).

% giobot does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	giobotDoes(Atom, R).

% giobot is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	giobotIs(Atom, R).

% **** SE ****
% Medicamento a tomar
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagMedicamento,
	medicamento(Atom, R).

% Receta de sintomas
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagReceta,
	receta(Atom, R).

% Especialista de enfermedad
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagEspecialista,
	especialista(Atom, R).

% diagnostico, que especialista y medicina tomar por enfermedad X
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDiagnostico,
	diagnostico(Atom, R).


replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
