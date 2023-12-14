padre(luis).
padre(abel).
padre(fausto).
padre(ramon).

madre(laura).
madre(silvia).
madre(maria).
madre(lucero).

padrede(luis, giovani).
padrede(luis, sofia).
padrede(luis, fatima).
padrede(abel, pablo).
padrede(abel, pedro).
padrede(ramon, monserrat).
padrede(fausto, ivan).
padrede(fausto, miriam).
padrede(fausto, carol).

madrede(maria, giovani).
madrede(maria, sofia).
madrede(maria, fatima).
madrede(lucero, pablo).
madrede(lucero, pedro).
madrede(laura, monserrat).
madrede(silvia, ivan).
madrede(silvia, miriam).
madrede(silvia, carol).

hermanode(luis,abel).
hermanode(giovani,sofia).
hermanode(giovani,fatima).
hermanode(silvia,laura).
hermanode(pablo,pedro).

% Reglas %
abuelos(X,Y):- padrede(X,W),padrede(W,Y);madrede(X,W),madrede(W,Y).