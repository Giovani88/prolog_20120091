# Giobot sistema experto

El chatbot "Giobot" tiene base de conocimiento de los siguientes temas:

1. Sistema experto basado en síntomas, enfermedades, medicamentos y especialistas.
2. En enfermedad **evola**.
3. En la serie de **naruto shipudden**.

## 1. Sistema experto
Giobot reconoce las siguientes preguntas:

* "tengo la enfermedad de ***gripe*** que medicamento debo tomar."

* "tengo el sintoma de ***tos*** que medicamento debo tomar."
* "tengo ***gripe*** que especialista me puede atender."
* "tengo la enfermedad de ***gripe*** que especialista y medicina necesito."


## 2. Naruto
Giobot reconoce las siguientes preguntas:

### 2.1 Definiciones
>que es ***sharingan***?

>que es la ***sharingan***?

>que es el ***sharingan***?

Base de conocimiento

* sharingan
* byakugan
* rinnegan
* chakra
* jutsu
* taijutsu
* genjutsu
* genin
* chunin
* jonin
* hokage
* akatsuki
* bijuu
* jinchuriki

### 2.2 Personajes
>quien es **naruto**?

>conoces a **naruto**?

Responde acerca de personajes de la serie, su base de conocimiento es la siguiente:

* sasuke
* naruto
* sakura
* kakashi
* itachi
* jiraiya
* madara

### 2.3 Jinchurikis y Bijuus
Responde a quien es el Jinchuriki de un bijuu o quien es el bijuu de un Jinchuriki

> quien es el jinchuriki de **kurama**?

> cual es el bijuu de **naruto**?

su base de conocimiento es la siguiente:

* Jinchurikis
  * naruto
  * gaara
  * yugito
  * yagura
  * fu
  * han

* Bijuus
  * kurama
  * shukaku
  * matatabi
  * isobu
  * chomei
  * kokuo

### 2.4 Clanes
Responde a cual clan pertenece cierto personaje ingresado por el usuario, o de manera inversa, responde los miembros que pertenecen a cierto clan.

> quienes son del clan ***uchiha***
> 
> quienes pertenecen al clan ***uchiha***
> 
> quienes forman parte del clan ***uchiha***

Clanes que conoce:
* haruno
* uzumaki
* kazekage
* hoshigaki
* hyuga
* uchiha
* hatake

Asi mismo, responde a que clan pertenece un personaje.

> a que clan pertenece ***itachi***?
> 
> cual es el clan de ***itachi***?
>
> clan de ***itachi***?

Personajes que conoce:

* sakura
* naruto
* gaara
* kisame
* hinata
* sasuke
* itachi
* madara
* tobi
* kakashi

### 2.5 Relacion entre personajes
Responde a la relación que hay entre dos personajes proporcionados por el usuario. Ejemplo: La relación entre **madara** y **hashirama** son **rivales**.

Tiene la propiedad de que busca la respuesta en el hecho de forma ordenada o invirtiendo los parámetros para encontrar la relación. Ejemplo: que relacion tiene ***madara*** y ***hashirama***? o que relacion tiene ***hashirama*** y ***madara***? el resultado sera el mismo, ***rivales***

Regla implementada:
``` prolog
relacionDe(X,X2,R):- (relacion(Relacion,X,X2);relacion(Relacion,X2,X)),R=[X,' y ',X2,' son ',Relacion].
```
Hecho implementado:
``` prolog
relacion(rivales,madara,hashirama).
```

> que relacion tiene ***madara*** y ***hashirama***?
>
> cual es la realcion entre ***hinata*** y ***naruto***?

base de conocimiento:
``` prolog
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
```

### 2.6 Relación entre maestro y estudiante 
Responde a quien fue el maestro o los maestros de un ninja

> quien fue el maestro de ***sasuke***?
> 
> quien fue el sensei de ***sakura***?
>
> quien entreno a ***naruto***?

base de conocimiento:

``` prolog
senseide(jiraiya, naruto).
senseide(kakashi, naruto).
senseide(kakashi, sasuke).
senseide(tsunade, sakura).
senseide(minato, kakashi).
senseide(orochimaru, sasuke).
senseide(naruto, konohamaru).
senseide(guy, lee).
senseide(madara, obito).
senseide(hiruzen, jiraiya).
```

## 3. Enfermedad EBOLA
Giobot tiene base de conocimiento acerca de la enfermedad EBOLA acerca de los siguientes factores:

### 3.1 Definición
Responde a la pregunta, ¿Que es el ébola? 

Toma al **azar** una respuesta, de su base de conocimiento para la definicion de ebola.

> que es el **ebola**?
> 
> conoces la enfermedad **ebola**?
>
> conoces el **ebola**?
>
> que me puedes decir acerca del **ebola**?
>
> que es la enfermedad de **ebola**?
>
> dame informacion acerca del **ebola**?
>
> **ebola**
>
> **ebola**?

Para la respuesta se reutilizo el hecho **definicion** creado para el tema de naruto.

### 3.2 Sintomas
Responde a las preguntas relacionadas con consultas sobre cuales son los sintomas del ebola

Con el proposito de que fuera mas dinamica la respuesta, se utilizo una funcion que devuelve un elemento aleatorio de una lista de posibles respuestas

``` prolog
getRespuesta(Lista,Elemento):- 
	length(Lista,Length),
	random(0,Length,Num_aleatorio),
	nth0(Num_aleatorio,Lista,Elemento).
```

> cuales son los sintomas del ebola?
> 
> sintomas del ebola?
>
> conoces los sintomas del ebola?
>
> dime los sintomas del ebola

Tambien responde a preguntas relacionadas sobre si un sintoma pertenece a la enfermedad del Ebola.

> la **gripe** es un sintoma del ebola?
>
> el **gripe** es un sintoma del ebola?

### 3.3 Preguntas sobre regiones con brotes de ebola
Responde a cuales son los paises con brotes reportados de ebola.

> cuales son los paises con ebola?
>
> cuales son los paises con brotes de ebola?
>
> cuales paises evitar por el ebola?

**respuestas dinamicas**

preguntas sobre viajes hechos por el usuario.

> he viajado a ***pais*** tengo riesgo de tener ebola?
> 
> si he estado en ***pais*** tengo probabilidad de tener ebola?

**respuesta dinamica**

principales paises reportados con ebola:
* guinea
* liberia
* sierra_leona

### 3.4 Preguntas variadas sobre la enfermedad de ebola
respuestas diferentes para cada pregunta.

Origen
> origen del ebola
> 
> cual es el origen del ebola?
>
> en donde surgio el ebola por primera vez?
>
> en donde fue el primer brote de ebola?

Cura
> existe cura para el ebola? 
>
> cual es la cura para el ebola?
>

Contagio
> como se transmite el ebola?
>
> como se propaga el ebola?
>
> como se contagia el ebola?

Tratamientos y prevencion

> cuales son los cuidados del ebola?

Mortalidad
> cuantas son las muertes por el ebola?
>
> cuantas son las muertes registradas por el ebola?
> 
> cual es la tasa de mortalidad del ebola?

Otros

> existe riesgo de que el ebola llegue a mexico?
