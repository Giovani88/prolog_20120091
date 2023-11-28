
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

buscar([], E , 0).
buscar(X , E , 1) :- sintomade(X, E).
buscar([X|Xs] , E , P) :- enfermedad(E) , buscar(X , E , S1) , buscar(Xs , E ,S2) , P is S1 + S2.

cantSint(E , C) :- findall(X , sintomade(X, E) , L) , length(L , R), C is R.

diagnostico([X|Xs] , E , K) :- buscar([X|Xs] , E , P) , cantSint(E , T) , K is P * 100 / T.

medicinade(contrex, gripe). %contrex es medicamento de la gripe
medicinade(jarabe, gripe). %jarabe es medicamento de la gripe
medicinade(pastillas, tubercolosis). %pastillas es medicamento de la tubercolosis
medicinade(vacuna, malaria). %vacuna es medicamento de la malaria
medicinade(vacuna, rubeola). %vacuna es medicamento de la rubeola
medicinade(vitaminas, anemia). %vitaminas es medicamento de la anemia
medicinade(pastillas, hepatitis). %pastillas es medicamento de hepatitis

recetade(M, S):-sintomade(S, Z),medicinade(M, Z).
especialistade(otorrino, gripe).
especialistade(nutricionista, anemia).
especialistade(endocrinologia, hepatitis).
especialistade(medicinageneral, rubeola).
especialistade(nutricionista, tubercolosis).
especialistade(medicinageneral, malaria).

atiendeespecialista(E, S):- sintomade(S,Z),especialistade(E, Z).
mereceta(Es, M, E):-medicinade(M, E),sintomade(S, E), atiendeespecialista(Es,S).