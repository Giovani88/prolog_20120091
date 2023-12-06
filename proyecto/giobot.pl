giobot:- writeln('Hola , mi nombre es Giobot tu chatbot,
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

% template EBOLA definicion ebola
template([que,es,la,enfermedad,de,ebola,_], [flagDefinicion], [5]).

% template NARUTO
%	definiciones
template([que,es,el,s(_),_], [flagDefinicion], [3]).
template([que,es,la,s(_),_], [flagDefinicion], [3]).
template([que,es,s(_),_], [flagDefinicion], [2]).

%	bijuus y jinchurikis
template([quien,es,el,jinchuriki,de,s(_),_], [flagJinchuriki], [5]).
template([cual,es,el,bijuu,de,s(_),_], [flagBijuu], [5]).

%	personajes
template([quien,es,s(_),_], [flagDescripcion], [2]).
template([conoces,a,s(_),_], [flagDescripcion], [2]).

% 	clanes
template([quienes,son,del,clan,s(_),_], [flagClanMiembros], [4]).
template([quienes,pertenecen,al,clan,s(_),_], [flagClanMiembros], [4]).
template([quienes,forman,parte,del,clan,s(_),_], [flagClanMiembros], [5]).

% pertenencia de un clan
template([a,que,clan,pertenece,s(_),_], [flagPertenece], [4]).
template([cual,es,el,clan,de,s(_),_], [flagPertenece], [5]).
template([clan,de,s(_),_], [flagPertenece], [2]).

% relaciones entre personajes
template([que,relacion,tiene,s(_),y,s(_),_], [flagRelacion], [3,5]).
template([cual,es,la,relacion,entre,s(_),y,s(_),_], [flagRelacion], [5,7]).

% sensei
template([quien,fue,el,maestro,de,s(_)], [flagSensei], [5]).
template([quien,fue,el,sensei,de,s(_)], [flagSensei], [5]).
template([quien,entreno,a,s(_)], [flagSensei], [3]).

% template ebola
template([que,es,el,ebola,_], [flagDefinicion], [3]).
template([conoces,la,enfermedad,ebola,_], [flagDefinicion], [3]).
template([conoces,el,ebola,_], [flagDefinicion], [2]).
template([que,me,puedes,decir,acerca,del,ebola,_], [flagDefinicion], [6]).
template([ebola], [flagDefinicion], [0]).
template([ebola,_], [flagDefinicion], [0]).
template([dame,informacion,acerca,del,ebola,_], [flagDefinicion], [4]).

%sintomas ebola
template([cuales,son,los,sintomas,del,ebola,_], [flagGetSintomasEbola], [5]).
template([sintomas,del,ebola,_], [flagGetSintomasEbola], [2]).
template([conoces,los,sintomas,del,ebola,_], [flagGetSintomasEbola], [4]).
template([dime,los,sintomas,del,ebola], [flagGetSintomasEbola], [4]).

% Un sintoma es de la enfermedad de ebola
template([la,s(_),es,un,sintoma,del,ebola,_], [flagIsSintomaEbola], [1]).
template([el,s(_),es,un,sintoma,del,ebola,_], [flagIsSintomaEbola], [1]).

%paises con ebola
template([cuales,son,los,paises,con,ebola,_], [flagPaisesEbola], [5]).
template([cuales,son,los,paises,con,brotes,de,ebola,_], [flagPaisesEbola], [7]).
template([cuales,paises,evitar,por,el,ebola,_], [flagPaisesEbola], [5]).

%preguntas de paises 
template([he,viajado,a,s(_),tengo,riesgo,de,tener,ebola,_], [flagIsPaisEbola], [3]).

%preguntas frecuentes sobre el ebola
template([origen,del,ebola],['Desde que se detecto por primera vez en 1976 en una aldea cercana al rio Ebola, en la Republica Democratica del Congo (antigua Zaire), los brotes de Ebola se han registrado en distintas zonas de Africa.'], []).

template([cual,es,el,origen,del,ebola,?],['El virus del Ebola fue identificado por primera vez en 1976 durante dos brotes simultaneos en Sudan y la Republica Democratica del Congo. Estos brotes ocurrieron en aldeas cercanas al rio Ebola, de donde proviene el nombre del virus.'], []).

template([en,donde,surgio,el,ebola,por,primera,vez,?],['El primer registro del virus del Ebola se remonta a 1976, cuando se identifico durante brotes simultáneos en Sudan y la Republica Democratica del Congo. Estos brotes tuvieron lugar en aldeas cercanas al rio Ebola, que es la fuente del nombre del virus.'], []).

template([en,donde,fue,el,primer,brote,de,ebola,?],['El primer brote se registro en Yambuku, en el norte de Zaire (actualmente Republica Democratica del Congo), y el segundo en Nzara, Sudan. Aunque los dos brotes estaban separados por más de 500 kilometros, ambos se asociaron con infecciones similares y mortales.'], []).

template([existe,cura,para,el,ebola,?],['Desafortunadamente, no existe un tratamiento específico o vacuna para esta enfermedad, registrado en 2023, pero puedes preguntarme sobre los cuidados medicos.'], []).

template([cual,es,la,cura,para,el,ebola,?],['No hay cura especifica para el ebola, registrada en 2023, pero consulta fuentes actualizadas para informacion reciente'], []).

template([como,se,transmite,el,ebola,?],['Se transmite de persona a persona, al tener contacto directo con sangre, secreciones y liquidos corporales (vomito, orina, heces, sudor, semen, flemas) de las personas infectadas con el virus o que mueran a causa de la enfermedad. Asi como al tener contacto con objetos contaminados con el virus como, agujas y equipo medico.
El virus del ebola no se transmite a traves del aire, agua o alimentos.'], []).

template([como,se,propaga,el,ebola,?],['La infeccion se produce por contacto directo o indirecto con la sangre u otros liquidos o secreciones corporales (heces, orina, saliva, semen) de personas infectadas, solo cuando estas presentan sintomas.'], []).

template([como,se,contagia,el,ebola,?],['El ebola se transmite principalmente a traves del contacto directo con la sangre, fluidos corporales u organos de personas o animales infectados. Tambien puede propagarse mediante el contacto con superficies u objetos contaminados. '], []).


template([cuales,son,los,cuidados,del,ebola,?], ['Los cuidados para el ebola incluyen medidas de higiene rigurosas, como el lavado frecuente de manos con agua y jabon. Además, es crucial utilizar equipo de protección personal al cuidar a personas infectadas. El aislamiento adecuado y la desinfeccion de superficies son fundamentales para prevenir la propagacion del virus.'], []).



template([cuantas,son,las,muertes,causadas,por,el,ebola,?], ['El brote de ebola en Africa Occidental cobro la vida de 11,315 personas tras de ser oficialmente declarada el 22 de marzo 2016 en Guinea.'], []).

template([cuantas,son,las,muertes,registradas,por,el,ebola,?], ['La epidemia de Ebola en Africa Occidental resulto en la perdida de 11,315 vidas despues de ser oficialmente declarada el 22 de marzo de 2016 en Guinea.'], []).

template([cual,es,la,tasa,de,mortalidad,del,ebola,?], ['Con mas de una docena de brotes en siete paises africanos desde 1976, el ebola ha mostrado tasas de mortalidad que varian entre el 22% y el 88%.'], []).


template([existe,riesgo,de,que,el,ebola,llegue,a,mexico,?], ['La probabilidad de que esta enfermedad se presente en Mexico es baja, segun un articulo publicado por la secretaria de salud de Mexico.'], []).




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

% ** reglas SE **
% medicamento a tomar:
medicamento(X, R):- medicinade(Y,X), R=['Deberias',tomar,Y].
medicamento(X, R):- \+medicinade(_,X), R=['Lo siento',no,conozco,el,medicamento, que,debes,tomar,para,X].

% medicamento a tomar por sintoma
receta(X,R):-sintomade(X, Z),medicinade(M, Z), R=['Deberias',tomar,M,para,el,sintoma,X].
receta(X,R):- \+sintomade(X, Z),medicinade(_, Z), R=['Lo siento no conozco el medicamento para el sintoma de',X].

% especialista por enfermedad
especialista(X,R):- especialistade(M,X),R=['Especialista',M].
especialista(X,R):- \+especialistade(_,X),R=['Lo siento, no conozco el especialista para',X].

% que especialista atiende y que medicina receta por enfermedad x
diagnostico(E, R):- mereceta(Es,M,E), R=[Es,M].


mereceta(Es, M, E):-medicinade(M, E),sintomade(S, E), atiendeespecialista(Es,S).
atiendeespecialista(E, S):- sintomade(S,Z),especialistade(E, Z).

% ** reglas NARUTO **
definicion(X,R):- definicionde(Lista,X),
					length(Lista, Length),
					random(0, Length, Index),
					nth0(Index, Lista, Elemento),
  				   	R=[Elemento].

definicion(X,R):- \+definicionde(_,X),R=['Lo siento, en mi ultima version 2023 no conozco que es',X].					

descripcion(X,R):- descripcionde(Lista,X),
					length(Lista, Length),
					random(0, Length, Index),
					nth0(Index, Lista, Elemento),
  				   	R=[Elemento].

descripcion(X,R):- \+descripcionde(_,X),R=['Lo siento, en mi ultima version 2023 no conozco a',X].

jinchurikide(X,R):- jinchuriki(J,X),R=['El jinchuriki de ', X ,' es',J].

jinchurikide(X,R):- \+jinchuriki(_,X),R=['Lo siento, en mi ultima version no conozco quien es el jinchuriki de',X].

bijuude(X,R):- jinchuriki(X,B),R=['El bijuu de ', X ,' es',B].
bijuude(X,R):- \+jinchuriki(X,_),R=['Lo siento, en mi ultima version no conozco quien es el bijuu de', X].

miembrosClan(X,R):- findall(M,pertenece_clan(M,X),Miembros),length(Miembros,Length),Length>0,R=[Miembros,' pertenecen al clan ',X].
miembrosClan(X,R):- \+pertenece_clan(_,X),R=['Lo siento, en mi ultima version no conozco quien pertenece al clan de',X].

perteneceClan(X,R):- pertenece_clan(X,C), R=[X,' pertenece al clan ',C].
perteneceClan(X,R):- \+pertenece_clan(X,_), R=['Lo siento, en mi ultima version no conozco a que clan pertenece ',X].

%realciones entre personajes
relacionDe(X,X2,R):- (relacion(Relacion,X,X2);relacion(Relacion,X2,X)),R=[X,' y ',X2,' son ',Relacion].
relacionDe(X,X2,R):- \+(relacion(_,X,X2);relacion(_,X2,X)),R=['Lo siento, en mi ultima version no conozco la relacion de ',X,' y ',X2].

%sensei de 
senseiDe(X,R):- findall(S,senseide(S,X),Lista),length(Lista,Length),Length>0,R=[Lista,' fueron los o el sensei de',X].
senseiDe(X,R):- findall(S,senseide(S,X),_),R=['Lo siento, en mi ultima version no conozco quien entreno a',X].

% reglas EBOLA
sintomasEbola(E,R):- findall(S,sintomade(S,E),Lista_sintomas),
					getRespuesta(['Claro, los sintomas son los siguientes','Si, estoy familiarizado con los sintomas del Ebola, son los siguientes','Estoy al tanto de los sintomas asociados con el Ebola, los cuales son ','Si, conozco los sintomas','Tengo la informacion de que los sintomas del Ebola, suelen ser'],R_prefix),
					getRespuesta(['Ante la presencia de sintomas persistentes, es recomendable consultar a un profesional de la salud para una evaluacion mas detallada.',"Recuerda que la informacion proporcionada no reemplaza el diagnostico medico profesional. Si tienes preocupaciones sobre tu salud, busca asesoramiento medico.",'La autodiagnostico no siempre es preciso. Si experimentas sintomas preocupantes, te instamos a buscar atencion medica adecuada.','La salud es una prioridad. No dudes en buscar ayuda medica si experimentas sintomas que te causan preocupacion.','Recuerda que cada persona es unica y puede reaccionar de manera diferente a los sintomas. Siempre es aconsejable buscar asesoramiento medico personalizado.'],R_sufix),
					R=[R_prefix,Lista_sintomas, R_sufix].

isSintomaEbola(X,R):- sintomade(X,ebola),
					getRespuesta(['Ante la presencia de sintomas persistentes, es recomendable consultar a un profesional de la salud para una evaluacion mas detallada.',"Recuerda que la informacion proporcionada no reemplaza el diagnostico medico profesional. Si tienes preocupaciones sobre tu salud, busca asesoramiento medico.",'La autodiagnostico no siempre es preciso. Si experimentas sintomas preocupantes, te instamos a buscar atencion medica adecuada.','La salud es una prioridad. No dudes en buscar ayuda medica si experimentas sintomas que te causan preocupacion.','Recuerda que cada persona es unica y puede reaccionar de manera diferente a los sintomas. Siempre es aconsejable buscar asesoramiento medico personalizado.'],R_sufix),
					R=['Si',X,' es un sintoma de ebola, pero no necesariamente puede ser ebola.',R_sufix].
isSintomaEbola(X,R):- \+sintomade(X,ebola),R=['No',X,' no es sintoma de ebola'].

paisesEbola(R):- findall(X,paisesConEbola(X),Lista_paises),
				getRespuesta(['fueron los paises mas afectados por esta epidemia en Africa Occidental entre 2014 y 2016','Si has visitado recientemente alguno de estos paises, se aconseja que busques atencion medica','En el caso de que hayas viajado recientemente a uno de estos paises, es aconsejable que te dirijas a un centro de atencion medica.','Si has realizado un viaje reciente a cualquiera de estos paises, se recomienda que busques asistencia medica.','Si has regresado hace poco de alguno de estos paises, se aconseja que busques atencion medica.','En el caso de que hayas estado en alguno de estos paises en un viaje reciente, es aconsejable que te acerques a un centro medico.'],R_sufix),
				R=[Lista_paises,R_sufix].


isPaisEbola(P,R):- paisesConEbola(P),
					getRespuesta(['Es recomendable que te aproximes a un centro medico.','Se aconseja que te dirijas a un centro de salud.','Es aconsejable que te acerques a un centro de atencion medica.','Se recomienda que te aproximes a un centro asistencial.','Es aconsejable dirigirte a un centro de atencion medica.'],R_sufix),
					R=['Es probable, si has estado recientemente en',P,R_sufix].

isPaisEbola(P,R):- \+paisesConEbola(P),R=['No ',P, 'No tiene reportes de ebola hasta la fecha de 2023'].




getRespuesta(Lista,Elemento):- 
	length(Lista,Length),
	random(0,Length,Num_aleatorio),
	nth0(Num_aleatorio,Lista,Elemento).



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


% *** NARUTO ***
% definicion de algun concepto
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDefinicion,
	definicion(Atom, R).

% descripcion de un personaje
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDescripcion,
	descripcion(Atom, R).

% jinchurikis
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagJinchuriki,
	jinchurikide(Atom, R).

% Bijuu
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagBijuu,
	bijuude(Atom, R).

% Cuales son los miembros de un clan
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagClanMiembros,
	miembrosClan(Atom, R).

% Personaje pertenencia a un clan
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagPertenece,
	perteneceClan(Atom, R).

% Relaciones entre personajes
replace0([I,L|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(L, Input, Atom2),
	nth0(0, Resp, X),
	X == flagRelacion,
	relacionDe(Atom,Atom2,R).

% Sensei de
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagSensei,
	senseiDe(Atom, R).

% replace EBOLA
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagGetSintomasEbola,
	sintomasEbola(Atom, R).

% is sintoma ebola?
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIsSintomaEbola,
	isSintomaEbola(Atom, R).

% paises con ebola
replace0([I|_], Input, _, Resp, R):-	
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagPaisesEbola,
	paisesEbola(R).

% si un pais tiene ebola
replace0([I|_], Input, _, Resp, R):-	
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIsPaisEbola,
	isPaisEbola(Atom,R).


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

% ** Hechos NARUTO
definicionde(['El Sharingan es un doujutsu que otorga habilidades visuales avanzadas. Permite ver el chakra, anticipar movimientos y copiar técnicas.',
			'Poder ocular en "Naruto" que concede vision mejorada, prevision de movimientos y la capacidad de copiar tecnicas de otros ninjas.',
			'Tecnica visual en el mundo de "Naruto" que se manifiesta como un patron de ojos con pupilas, proporcionando habilidades unicas como el analisis de jutsus y la anticipacion de ataques enemigos.'],sharingan).

definicionde(["El Byakugan es un doujutsu asociado al Clan Hyuga. Ofrece una vision de 360 grados y la capacidad de ver a traves de objetos solidos."],byakugan).			

definicionde(["El Rinnegan es un doujutsu legendario que otorga habilidades divinas. Permite controlar todas las formas de chakra y poseer técnicas poderosas."],rinnegan).			

definicionde(["El chakra es la energia espiritual y fisica combinada que todos los ninjas poseen. Se utiliza para realizar tecnicas y jutsus.",
             "El chakra es fundamental en la practica de las artes ninjas. Puede ser moldeado para realizar diversas habilidades y tecnicas."],chakra).

definicionde(["Un jutsu es una tecnica o habilidad ninja. Puede ser de naturaleza fisica, como el taijutsu, o basarse en el uso de chakra, como el ninjutsu y el genjutsu.",
			"Los jutsus son la manifestacion de las habilidades ninja. Cada ninja tiene su propio repertorio de tecnicas que define su estilo de combate."],jutsu).

definicionde(["Taijutsu es la forma de combate fisico en la que se utilizan las habilidades del cuerpo sin depender del chakra.",	
			"El Taijutsu se centra en las habilidades de combate cuerpo a cuerpo. Los practicantes de Taijutsu perfeccionan su fuerza, velocidad y agilidad para enfrentar a sus enemigos."],taijutsu).

definicionde(["Genjutsu es la forma de combate que involucra ilusiones y enganos para afectar los sentidos del oponente.",
			"Los Genjutsus son tecnicas que afectan la percepcion de la realidad. Pueden ser utilizados para confundir, desorientar o atrapar a los enemigos en ilusiones mortales."],genjutsu).

definicionde(["Genin es el rango ninja mas bajo. Son ninjas en entrenamiento que han completado la academia ninja.","En la jerarquia ninja, los Genin son los novatos. Desarrollan sus habilidades y conocimientos a traves de misiones y entrenamiento constante."],genin).

definicionde(["Chunin es el segundo rango ninja. Chunins son ninjas con habilidades y experiencia mas avanzadas."],chunin).

definicionde(["Jonin es el tercer rango ninja. Jonins son expertos y lideres de equipos ninja."],jonin).

definicionde(["El Hokage es el lider de la Aldea Oculta de la Hoja. Es el ninja mas fuerte de la aldea y actua como su protector y lider."],hokage).

definicionde(["Akatsuki es una organizacion criminal formada por ninjas renegados. Buscan objetivos relacionados con el poder y la dominacion mundial.",
			"Los miembros de Akatsuki tienen habilidades poderosas y objetivos individuales. La organizacion desempena un papel crucial en la trama de Naruto."],akatsuki).

definicionde(["Un bijuu es una bestia con cola, criatura masiva y poderosa que posee chakra. Los bijuus son sellados en jinchurikis, personas que pueden controlar su poder."],bijuu).

definicionde(["Un jinchuriki es una persona que ha sido sellada con un bijuu. Pueden controlar el poder del bijuu, pero a menudo enfrentan desafios debido a la bestia en su interior."],jinchuriki).

definicionde(['El Ebola es una enfermedad viral grave y contagiosa que puede provocar fiebre alta y hemorragias internas y externas. Es causada por el virus del Ebola y se transmite por contacto directo con sangre y fluidos corporales.','El Ebola es una enfermedad viral aguda y peligrosa que afecta a humanos y otros primates. Se caracteriza por sintomas como fiebre alta y hemorragias, transmitiendose principalmente por contacto directo con fluidos corporales de individuos infectados.','El ebola, tambien conocido como enfermedad por el virus del Ebola, es un tipo de fiebre hemorragica. Es una enfermedad rara y, a menudo, mortal. Puede ser causado por varios tipos diferentes de virus del Ebola.','El virus del Ebola causa una enfermedad aguda grave que se caracteriza por fiebre de inicio subito, cansancio extremo, vomito y/o diarrea, falta de apetito, dolor de cabeza, de estomago y/o garganta y en algunos casos se presentan hemorragias internas y externas, llegando a ser fatal.','Es una enfermedad causada en el ser humano por el virus del Ebola. Normalmente los sintomas comienzan entre los dos dias y las tres semanas despues de haber contraido el virus, con fiebre, dolor de garganta, dolores musculares, y dolor de cabeza.'],ebola).


% personajes
descripcionde(['Sasuke es un prodigio en las artes ninja y desarrolla el Sharingan. A lo largo de la serie, oscila entre la oscuridad y la luz, buscando su propio camino.'],sasuke).

descripcionde(["Naruto Uzumaki es el protagonista de la serie. Inicialmente es un ninja despreocupado y bromista, pero su objetivo es convertirse en Hokage para ser reconocido por todos."],naruto).

descripcionde(['Sakura es conocida por su destreza en el uso de tecnicas medicas y su lealtad a sus amigos.'],sakura).

descripcionde(["Kakashi Hatake es el lider del Equipo 7 y un ninja legendario. Es conocido como el 'Ninja Copia' por su habilidad para copiar las tecnicas de sus oponentes."],kakashi).

descripcionde(['Itachi Uchiha es el hermano mayor de Sasuke y un miembro exiliado del Clan Uchiha. Inicialmente es visto como un villano, pero su verdadera naturaleza se revela mas tarde.'],itachi).

descripcionde(["Jiraiya es un legendario Sannin y mentor de Naruto. Es conocido como el 'Sabio de los Sapos' por su habilidad en las tecnicas de invocacion de sapos."],jiraiya).

descripcionde(['Madara fue un legendario shinobi, co-fundador de Konoha y lider del Clan Uchiha durante su tiempo.'],madara).

%bijuus
jinchuriki(naruto, kurama). 
jinchuriki(gaara, shukaku). 
jinchuriki(yugito, matatabi). 
jinchuriki(yagura, isobu). 
jinchuriki(fu, chomei). 
jinchuriki(han, kokuo). 

%clanes
pertenece_clan(sakura, haruno).
pertenece_clan(naruto, uzumaki).
pertenece_clan(gaara, kazekage).
pertenece_clan(kisame, hoshigaki).
pertenece_clan(hinata, hyuga).
%pertenece_clan('itachi, sasuke, madara, tobi', uchiha).
pertenece_clan(sasuke, uchiha).
pertenece_clan(itachi, uchiha).
pertenece_clan(madara, uchiha).
pertenece_clan(tobi, uchiha).
pertenece_clan(kakashi, hatake).

%realciones
relacion(rivales,madara,hashirama).
relacion(rivales,sasuke,itachi).
relacion(rivales,naruto,kiba).

relacion(pareja,naruto, hinata).
relacion(pareja,sasuke, sakura).
relacion(pareja,minato, kushina).
relacion(pareja,jiraiya, tsunade).

relacion(amigos,naruto, sasuke).
relacion(amigos,sasuke, sakura).
relacion(amigos,naruto, sakura).
relacion(amigos,gaara, naruto).
relacion(amigos,itachi, kisame).

%senseide
senseide(jiraiya, naruto).
senseide(kakashi, sasuke).
senseide(tsunade, sakura).
senseide(minato, kakashi).
senseide(orochimaru, sasuke).
senseide(naruto, konohamaru).
senseide(guy, lee).
senseide(madara, obito).
senseide(hiruzen, jiraiya).
senseide(kakashi, naruto).

%hechos de ebola
paisesConEbola(guinea).
paisesConEbola(liberia).
paisesConEbola(sierra_leona).

% ** Hechos SE
	medicinade('contrex y jarabe', gripe). %contrex es medicamento de la gripe
	%medicinade(jarabe, gripe). %jarabe es medicamento de la gripe
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

	%sintomas de ebola
	sintomade(fiebre, ebola).	
	sintomade(dolor_muscular, ebola).
	sintomade(dolor_de_cabeza, ebola).
	sintomade(dolor_de_garganta, ebola).
	sintomade(diarrea, ebola).
	sintomade(vomitos, ebola).
	sintomade(erupciones_cutaneas, ebola).
	sintomade(sangrado, ebola).


	especialistade(otorrino, gripe).
	especialistade(nutricionista, anemia).
	especialistade(endocrinologia, hepatitis).
	especialistade(medicinageneral, rubeola).
	especialistade(nutricionista, tubercolosis).
	especialistade(medicinageneral, malaria).
