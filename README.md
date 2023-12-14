# Tareas y ejercicios

### Tareas y ejercicios realizados en clase para la materia de programación lógica y funcional. Agosto - Diciembre 2023.

### Jonathan Giovani Ceja Contreras
### 20120091

---
# Tabla de contenido
  - [Áreas y Volúmenes](#áreas-y-volúmenes)
    - [Ejercicios de Áreas](#ejercicios-de-áreas)
      - [Triangulo](#triangulo)
      - [Rectángulo](#rectángulo)
      - [Cuadrado](#cuadrado)
      - [Circulo](#circulo)
      - [Rombo](#rombo)
      - [Trapecio](#trapecio)
      - [Cometa](#cometa)
      - [Polígono regular](#polígono-regular)
      - [Corona circular](#corona-circular)
      - [Sector circular](#sector-circular)
    - [Ejercicios de Volúmenes](#ejercicios-de-volúmenes)
      - [Cubo](#cubo)
      - [Ortoedro](#ortoedro)
      - [Cilindro](#cilindro)
      - [Cono](#cono)
      - [Esfera](#esfera)
      - [Tetraedro](#tetraedro)
      - [Pirámide Triangular](#pirámide-triangular)
      - [Pirámide Cuadrangular](#pirámide-cuadrangular)
      - [Prisma Cuadrangular](#prisma-cuadrangular)
      - [Prisma Triangular](#prisma-triangular)
  - [Funciones Lambda](#funciones-lambda)
    - [¿Qué son las funciones lambda?](#qué-son-las-funciones-lambda)
    - [Ejercicios con funciones lambda](#ejercicios-con-funciones-lambda)
      - [Áreas](#áreas)
        - [Rectángulo](#rectángulo-1)
        - [Triangulo](#triangulo-1)
        - [Circulo](#circulo-1)
        - [Rombo](#rombo-1)
        - [Cuadrado](#cuadrado-1)
        - [Trapecio](#trapecio-1)
        - [Cometa](#cometa-1)
        - [Polígono regular](#polígono-regular-1)
        - [Corona circular](#corona-circular-1)
        - [Sector circular](#sector-circular-1)
      - [Volúmenes](#volúmenes)
        - [Cubo](#cubo-1)
        - [Ortoedro](#ortoedro-1)
        - [Cilindro](#cilindro-1)
        - [Cono](#cono-1)
        - [Esfera](#esfera-1)
        - [Tetraedro](#tetraedro-1)
        - [Pirámide triangular](#pirámide-triangular-1)
        - [Pirámide cuadrangular](#pirámide-cuadrangular-1)
        - [Prisma triangular](#prisma-triangular-1)
        - [Prisma cuadrangular](#prisma-cuadrangular-1)
  - [Funciones car y cdr](#funciones-car-y-cdr)
    - [Lista 1](#lista-1)
    - [Lista 2](#lista-2)
  - [Función recorre](#función-recorre)
  - [Función búsqueda de elemento](#función-búsqueda-de-elemento)
  - [Estructuras de control Lisp](#estructuras-de-control-lisp)
    - [Ejercicio 1](#ejercicio-1)
    - [Ejercicio 2](#ejercicio-2)
    - [Ejercicio 3](#ejercicio-3)
    - [Ejercicio 4](#ejercicio-4)
    - [Ejercicio 5](#ejercicio-5)
  - [Diagrama árbol binario](#diagrama-árbol-binario)
  - [Prueba de escritorio sistema experto](#prueba-de-escritorio-sistema-experto)



## Áreas y Volúmenes

Esta actividad implica calcular 10 áreas y volúmenes figuras geométricas con el objetivo de comprender y practicar el lenguaje de programación CLISP.

En cada programa, el usuario deberá ingresar los datos de entrada requeridos para el calculo del área y/o volumen

El archivo de la practica se encuentra ubicado en el folder "Áreas y Volúmenes". A continuación, se explica mas a detalle como se realizo la actividad.

### Ejercicios de Áreas
#### Triangulo

La formula para calcular el area es la siguiente:

> base * altura / 2

El código que realiza el calculo, es el siguiente:

``` lisp
(defun area_triangulo()
    (princ "Escriba la base: ")
    (setq base (read))
    (princ "Escriba la altura: ")
    (setq altura (read))
    (write  (/ (* base altura) 2))
)
```

Como se muestra, se le pide al usuario que ingrese la base y la altura, cada valor se guarda en su respectiva variable usando la función **setq**, después se hace el calculo dentro de la función **write** para mostrar el resultado. 

Las operaciones en lisp son en pre-orden, por eso, primero se determina la operación aritmética a realizar escribiendo en una función como argumentos el operador y seguido se ingresan los operadores.

#### Rectángulo

La formula es la siguiente:

> base * altura

``` lisp
(defun area_rectangulo()
    (princ "Escriba la base: ")
    (setq base (read))
    (princ "Escriba la altura: ")
    (setq altura (read))
    (write  (* base altura))
)
```
De manera similar al área del triangulo, se pide la base y altura y el calculo es el mismo, solo que esta vez, no se divide entre dos.

#### Cuadrado

Su formula es:

> lado * lado

``` lisp
(defun area_cuadrado()
    (princ "Escriba un lado: ")
    (setq lado (read))
    (write (* lado lado))
)
```
Se lee el valor del lado ingresado por el usuario y se hace la operación de **lado * lado** (puede verse como lado al cuadrado).

#### Circulo

La formula para calcular el área del circulo, es la siguiente:

> radio<sup>2</sup> * PI

``` lisp
(defun area_circulo()
    (princ "Escriba el radio: ")
    (setq radio (read))
    (write (* radio radio 3.1416))
)
```
Primero. se le pide al usuario ingrese el valor del radio. Después para el calculo, se multiplica dos veces el radio para obtener el cuadrado y se multiplica por el valor de PI definido como 3.1416

#### Rombo

Para el calculo del área del rombo, se realizo la siguiente función:

``` lisp
(defun area_rombo()
    (princ "Escriba D: ")
    (setq d1 (read))
    (princ "Escriba d: ")
    (setq d2 (read))
    (write (/ (* d1 d2) 2))
)
```
Se le pide al usuario d1 y d2 (la diagonal mayor), después se multiplican y el producto se divide entre dos.

#### Trapecio


Se implementó la siguiente función para calcular el área del trapecio.

``` lisp
(defun area_trapecio()
    (princ "Escriba la altura: ")
    (setq altura (read))
    (princ "Escriba B: ")
    (setq b1 (read))
    (princ "Escriba b: ")
    (setq b2 (read))
    (write (/ (* (+ b1 b2) altura) 2))
)
```
Se pide al usuario la altura, b1 y b2, después de suma b1 y b2, luego se multiplica por la altura y al final se divide el resultado entre dos.

#### Cometa

Se ha diseñado una función con la finalidad de calcular el área del rombo.

``` lisp
(defun area_cometa()
    (princ "Escriba D: ")
    (setq d1 (read))
    (princ "Escriba d: ")
    (setq d2 (read))
    (write (* (/ d1 2) d2))    
)
```

#### Polígono regular


Se realizó la siguiente función para calcular el área de un polígono regular.

``` lisp
(defun area_poligono_regular()
    (princ "Escriba el número de lados: ")
    (setq numero_lados (read))
    (princ "Escriba el valor de un lado: ")
    (setq lado (read))
    (setq angulo (/ 360 (* 2 numero_lados)))
    (setq apotema (/ lado (* 2 (tan (/ (* angulo 3.1416) 180)))))
    (write (/ (* apotema numero_lados lado) 2))
)
```
Se le solicita al usuario el número de lados (numero_lados) y el valor de un lado. Posteriormente, se hace calculo del angulo, dividiendo 360 entre dos veces el número de lados. Se guarda en una variable llamada **angulo**.

Luego, se guarda en una variable el valor de **apotema**. El valor se obtiene dividiendo el lado entre dos veces la tangente de multiplicar el angulo por PI (3.1416) y dividirse entre 180. La función **tan** es nativa de Lisp.

Finalmente, el resultado se obtiene al dividir el producto del valor de apotema, numero de lados y lado, entre dos.

#### Corona circular

Se diseñó la siguiente función, para calcular el área de una corona circular.

``` lisp
(defun area_corona_circular()
    (princ "Escriba R: ")
    (setq r (read))
    (princ "Escriba r: ")
    (setq r2 (read))
    (write (* 3.1416 (- (* r r) (* r2 r2))))
)
```
Se le solicita al usuario el radio del circulo menor (r) y del circulo mayor (r2).

Para el resultado, se hace la diferencia del cuadrado del radio menor y el cuadrado del radio mayor y al final, se multiplica por la constante PI.

#### Sector circular

Se cuenta la siguiente función para el cálculo del área de un sector circular.

``` lisp
(defun area_sector_circular()
    (princ "Escriba el angulo: ")
    (setq angulo (read))
    (princ "Escriba el radio: ")
    (setq radio (read))
    (write (/ (* 3.1416 radio radio angulo) 360))
)
```
De manera sencilla, se le solicita la usuario como dato de entrada el valor del angulo y radio, luego el resultado se obtiene dividiendo el producto de PI por radio<sup>2</sup> y el angulo, entre 360.

### Ejercicios de Volúmenes

A continuación, se explican las funciones realizadas para el calculo del volumen de 10 figuras geométricas.

#### Cubo

``` lisp
(defun volumen_cubo()
    (princ "Escriba el valor de un lado: ")
    (setq lado (read))
    (format t "El volumen del cubo es: ~d unidades cubicas" (* lado lado lado))
)
```
Se ingresa el valor de un lado, y se obtiene elevando al cubo el valor, o bien, multiplicando tres veces el valor.

#### Ortoedro

``` lisp
(defun volumen_ortoedro()
    (princ "Escriba la longitud (a): ")
    (setq a (read))
    (princ "Escriba la latitud (b): ")
    (setq b (read))
    (princ "Escriba la altura (h): ")
    (setq h (read))
    (format t "El volumen del ortoedro es: ~d unidades cubicas" (* a b h))
)
```
Se solicita el valor de la longitud (a), latitud (b) y la altura (h). Luego el resultado es obtenido al multiplicar los tres valores mencionados.

#### Cilindro

``` lisp
(defun volumen_cilindro()
    (princ "Escriba el radio: ")
    (setq radio (read))
    (princ "Escriba la altura: ")
    (setq altura (read))
    (format t "El volumen del cilindro es: ~d unidades cubicas" (* 3.1416 radio radio altura))
)
```
El usuario ingresa el radio y la altura. El resultado se obtiene mediante la multiplicación de la constante PI por el radio al cuadrado y la altura. 

Nótese que a partir de este ejercicio, se utilizara la función **format t**, es util para formatear una cadena y poner en cierta posición algún valor. En este caso, se remplaza el **~d** por el resultado de la operación.

#### Cono

``` lisp
(defun volumen_cono()
    (princ "Escriba la altura: ")
    (setq altura (read))
    (princ "Escriba el radio: ")
    (setq radio (read))
    (setq volumen (/ (* 3.1416 radio radio altura) 3))
    (format t "El volumen del cono es: ~d unidades cubicas" volumen)
)
```
Se ingresa el valor de la altura y radio. El resultado se obtiene al dividir el producto de la constante PI por dos veces el radio entre 3.


#### Esfera

``` lisp
(defun volumen_esfera()
    (princ "Escriba el radio: ")
    (setq radio (read))
    (format t "El volumen de la esfera es: ~d unidades cubicas" (/ (* 4 3.1416 (expt radio 3)) 3))
)
```
Se escribe el radio como dato de entrada, luego el resultado se obtiene a traves de la division del producto de la constante PI por 4, y el radio elevado al cubo entre tres.

Se utilizó la función primitiva **expt** la cual, eleva una potencia (primer parámetro) al valor del segundo parámetro.

#### Tetraedro

``` lisp
(defun volumen_tetraedro() 
    (princ "Escriba el valor de una arista: ")
    (setq arista (read))
    (format t "El volumen del tetraedro es: ~d unidades cubicas" (* (/ (sqrt 2) 12) (expt arista 3)))    
)
```

Se solicita el valor de una arista y después se obtiene el volumen al multiplicar la raíz cuadrada de dos entre doce y el valor de la arista el cubo.

Para el calculo de la raíz cuadrada, se utilizó la función de **sqrt**.

#### Pirámide Triangular

``` lisp
(defun volumen_piramide_triangular()
    (princ "Escriba el valor de la base: ")
    (setq base (read))
    (princ "Escriba el valor de la altura de la base: ")
    (setq altura_base (read))
    (princ "Escriba la altura de la piramide: ")
    (setq altura_piramide (read))
    (setq area (/ (* base altura_base) 2))
    (format t "El volumen de la piramide triangular es: ~d unidades cubicas." (/ (* area altura_piramide) 3))
)
```
Se ingresa el valor de la base, altura de la base y altura de la piramide.

Primero se calcula el área de la base, usando la formula del triangulo. Luego, se multiplica el area por la altura de la piramide, y al final, se divide entre tres.

#### Pirámide Cuadrangular

``` lisp
(defun volumen_piramide_cuadrangular()
    (princ "Escriba el valor de la base: ")
    (setq base (read))
    (princ "Escriba el valor de la altura de la piramide: ")
    (setq altura (read))
    (format t "El volumen de la piramide cuadrangular es: ~d unidades cubicas" (/ (* (expt base 2) altura) 3))
)
```
Se ingresa el valor de la base y altura de la piramide, luego se eleva al cuadrado la base, se multiplica por la altura y se divide entre tres.

#### Prisma Cuadrangular

``` lisp
(defun volumen_prisma_cuadrangular()
    (princ "Escriba el valor de la base: ")
    (setq base (read))
    (princ "Escriba la altura del prisma: ")
    (setq altura (read))
    (format t "El volumen del prisma cuadrangular es: ~d unidades cubicas" (* (expt base 2) altura))
)
```
Se ingresa el valor de la base y altura del prisma, Luego, se multiplica la base elevada al cuadrado por la altura, para obtener el resultado.

#### Prisma Triangular

``` lisp
(defun volumen_prisma_triangular()
    (princ "Escriba el valor de la base: ")
    (setq base (read))
    (princ "Escriba el valor de la altura de la base: ")
    (setq altura_base (read))
    (princ "Escriba el valor de la altura del prisma: ")
    (setq altura_prisma (read))
    (format t "El volumen del prisma triangular es: ~d unidades cubicas" (* (/ (* base altura_base) 2) altura_prisma))
)
```

Se obtiene como dato de entrada, el valor de la base, altura de la base y altura del prisma. Seguidamente, se multiplica la base por altura entre dos por el valor de la altura del prisma.

## Funciones Lambda

Para esta actividad, se modifico la actividad anterior "Areas y Volumenes", de modo que, las funciones hechas sean remplazadas por funciones lambda.

En Lisp, una función lambda se declara de la siguiente manera

``` lisp
(defvar *nombre_referencia* (lambda (a b) (* a b)))

```
Se utiliza la función **lambda**, después los parámetros que recibirá la función y luego el cuerpo de la función.

### ¿Qué son las funciones lambda?
Son funciones anónimas, es decir, no tienen nombre. A diferencia de las funciones ordinarias, estas funciones existen cuando se llaman, es decir, no están todo el tiempo ocupando memoria, solo cuando se ejecutan.

### Ejercicios con funciones lambda
A continuación, se muestran las funciones lambda elaboradas. La función lambda obtiene el mismo resultado que las funciones explicadas anteriormente, por lo que, se omitirá esa parte, ya que el contenido de las operaciones de las funciones lambda son lo mismo a las ordinarias.

#### Áreas

A continuación, se muestran las funciones para calcular el area de figuras geometricas, pero ahora, como funciones lambda

##### Rectángulo

``` lisp
(defvar *area_rectangulo* (lambda (a b) (* a b)))
```
##### Triangulo

``` lisp
(defvar *area_triangulo* (lambda (altura base) (/ (* altura base) 2)))
```
##### Circulo

``` lisp
(defvar *area_circulo* (lambda (radio) (* radio radio 3.1416)))
```
##### Rombo

``` lisp
(defvar *area_rombo* (lambda (d1 d2) (/ (* d1 d2) 2)))

```
##### Cuadrado

``` lisp
(defvar *area_cuadrado* (lambda (lado)(* lado lado)))
```
##### Trapecio

``` lisp
(defvar *area_trapecio* (lambda (b1 b2 altura) (/ (* (+ b1 b2) altura) 2)))
```
##### Cometa

``` lisp
(defvar *area_cometa* (lambda (d1 d2) (* (/ d1 2) d2)))
```
##### Polígono regular

``` lisp
(defvar *area_poligono_regular* (lambda (numero_lados lado) 
        (setq angulo (/ 360 (* 2 numero_lados)))
        (setq apotema (/ lado (* 2 (tan (/ (* angulo 3.1416) 180)))))
        (/ (* apotema numero_lados lado) 2)
    )
)
```
##### Corona circular

``` lisp
(defvar *area_corona_circular* (lambda (r r2) (* 3.1416 (- (* r r) (* r2 r2)))))

```
##### Sector circular

``` lisp
(defvar *area_sector_circular* (lambda (angulo radio) (/ (* 3.1416 radio radio angulo) 360)))

```

#### Volúmenes

##### Cubo

``` lisp
(defvar *volumen_cubo* (lambda (lado)(format t "El volumen del cubo es: ~d unidades cubicas" (* lado lado lado))))
```
##### Ortoedro

``` lisp
(defvar *volumen_ortoedro* (lambda (a b h)(format t "El volumen del ortoedro es: ~d unidades cubicas" (* a b h))))
```
##### Cilindro

``` lisp
(defvar *volumen_cilindro* (lambda (radio altura)(format t "El volumen del cilindro es: ~d unidades cubicas" (* 3.1416 radio radio altura))))
```
##### Cono

``` lisp
(defvar *volumen_cono* (lambda (altura radio)
        (setq volumen (/ (* 3.1416 radio radio altura) 3))
        (format t "El volumen del cono es: ~d unidades cubicas" volumen)
    )    
)
```
##### Esfera

``` lisp
(defvar *volumen_esfera* (lambda (radio)(format t "El volumen de la esfera es: ~d unidades cubicas" (/ (* 4 3.1416 (expt radio 3)) 3))))
```
##### Tetraedro

``` lisp
(defvar *volumen_tetraedro* (lambda (arista)(format t "El volumen del tetraedro es: ~d unidades cubicas" (* (/ (sqrt 2) 12) (expt arista 3)))))
```
##### Pirámide triangular

``` lisp
(defvar *volumen_piramide_triangular* (lambda (base altura_base altura_piramide)
    (setq area (/ (* base altura_base) 2))
    (format t "El volumen de la piramide triangular es: ~d unidades cubicas." (/ (* area altura_piramide) 3))
))
```
##### Pirámide cuadrangular

``` lisp
(defvar *volumen_piramide_cuadrangular* (lambda (base altura)(format t "El volumen de la piramide cuadrangular es: ~d unidades cubicas" (/ (* (expt base 2) altura) 3))))

```
##### Prisma triangular

``` lisp
(defvar *volumen_prisma_triangular* (lambda (base altura_base altura_prisma)(format t "El volumen del prisma triangular es: ~d unidades cubicas" (* (/ (* base altura_base) 2) altura_prisma))))

```
##### Prisma cuadrangular

``` lisp
(defvar *volumen_prisma_cuadrangular* (lambda (base altura)(format t "El volumen del prisma cuadrangular es: ~d unidades cubicas" (* (expt base 2) altura))))

```


## Funciones car y cdr

Las funciones car y cdr son útiles para trabajar con listas. Por su parte, **car** obtiene la cabeza, es decir, el primer elemento de la lista. Por otro lado, **cdr** obtiene el resto de la lista (todos menos la cabeza).

La practica consiste en, dada una lista, obtener elementos específicos usando las funciones anteriores.

### Lista 1
La primer lista para la practica, es la siguiente:

> 1 2 3 4 (a b c) (c d e)

``` lisp
(setq lista1 '(1 2 3 4 (a b c) (c d e)))
```

Las instrucciones para obtener los elementos específicos, son las siguientes:

* Obtener 1

``` lisp
(print (car lista1))
```

* Obtener A

``` lisp
(print (caar (cddddr lista1)))
```

* Obtener C

``` lisp
(print (caadr (cddddr lista1)))
```

### Lista 2
La segunda lista es la siguiente:

> (((a b c) 5) 6) 7 (8 9 10)

``` lisp
(setq lista2 '((((a b c) 5) 6) 7 (8 9 10)))
```

* Obtener a

``` lisp
(print (caaaar lista2))
```

* Obtener b

``` lisp
(print (car (cdaaar lista2)))
```
* Obtener c

``` lisp
(print (cadr (cdaaar lista2)))

```
* Obtener 5

``` lisp
(print (cadaar lista2))
```
* Obtener 6

``` lisp
(print (cadar lista2))
```
* Obtener 7

``` lisp
(print (cadr lista2))
```
* Obtener 8

``` lisp
(print (caaddr lista2))
```
* Obtener 9

``` lisp
(print (car (cdaddr lista2)))
```
* Obtener 10

``` lisp
(print (cadr (cdaddr lista2)))
```

## Función recorre

Esta función recorre, se explicó en clase. Consiste en usar la función **car** para tomar el primer elemento de la lista, y luego, mediante una función recursiva, se podría obtener todos los elementos de la lista.

La actividad consiste en modificar la función recorre para que no se cicle y se puedan obtener todos los elementos de la lista de manera recursiva.

El código que resuelve el problema es el siguiente:

``` lisp
(defun recorre(lista item)
    (if (eq (car lista) item)
        (format t "El elemento ~A existe en la lista." item)
    )
    (if lista
        (recorre (cdr lista) item)
    )
)
```
Como se observa se hace recursiva la función **recorre**, cuya condición de parada, es una condicional **if** que permite validar si la lista contiene elementos o bien, que no este vacía, mientras **NO** este vacía, la función se seguirá llamándose a si misma.

Cada vez que se llama a si misma la función, se le envía como parámetro la misma lista pero con la función **cdr** para poder mandar los elementos restantes de la lista.

## Función búsqueda de elemento
Esta practica consiste en, usar la función **recorre** y modificarla para validar si un elemento **X** existe o no en una lista.

La propuesta de código para resolver el problema, es el siguiente:

``` lisp
(defun recorre(lista item)
    (if (eq (car lista) item)
        (format t "El elemento ~A existe en la lista." item)
    )
    (if lista
        (recorre (cdr lista) item)
    )
)
```
Como se observa, solo se agrega otro if, el cual utiliza la **función eq** para comparar si dos elementos son iguales, en este caso, comparar la cabeza de la lista recibida con el elemento buscado. 

También, cada vez que se manda a llamar a la lista, se agrega como segundo parámetro de la función recorre, el elemento a buscar (**item**).

## Estructuras de control Lisp
Esta practica consiste en utilizar estructuras de control para resolver los siguientes problemas.

### Ejercicio 1
Una tienda que vende pantalones Dickies al menudeo y al mayoreo tiene las siguientes tarifas, si se compran menos de 5 pantalones estos se cobran a su precio normal, en caso de que se copren 5 o mas pero menos de 12 , se les descuenta el 15% en cada pantalon, si se compran mas de 12 se les descuenta 30% en cada pantalon.  Escriba un programa que pida como dato de entrada el numero de pantalones que se desean comprar y con ello imprima el total a pagar por la compra hecha.

El código que resuelve el problema, es el siguiente:

``` lisp
(defun pantalones()
    (setq costo 200)
    (princ "Numero de pantalones: ")
    (setq num_pantalones (read))
    (format t "Total a pagar por ~d pantalones:~%" num_pantalones)
    (cond         
        ((< num_pantalones 5) (format t "$~d pesos." (* costo num_pantalones)))
        ((and (>= num_pantalones 5) (< num_pantalones 12)) (format t "$~d pesos." (* 0.85 costo num_pantalones)))
        (t (format t "$~d pesos." (* 0.70 costo num_pantalones)))
    )    
)
```

Primero, se define el valor de cada pantalón que sera de 200, luego se le pide al usuario ingrese el valor del numero de pantalones. Seguido de un mensaje que indica "Total a pagar por **n** pantalones".

Después, se hace la condicional usando la **función cond** para establecer rangos. Estos intervalos son:

* 0 a 4 pantalones: 
``` lisp
((< num_pantalones 5) (format t "$~d pesos." (* costo num_pantalones)))
```
En donde se multiplica el valor del costo unitario del pantalón por la cantidad.

* 5 a 11 pantalones:

``` lisp
((and (>= num_pantalones 5) (< num_pantalones 12)) (format t "$~d pesos." (* 0.85 costo num_pantalones)))
```
Se agrega un **and** para poder agregar dos comparaciones y lograr el intervalo de 5 a 11. Luego, si es verdad, se multiplica el costo unitario por 0.85 para aplicar el descuento y por el numero de pantalones.

* 12 o más pantalones
``` lisp
(t (format t "$~d pesos." (* 0.70 costo num_pantalones)))
```
Es este caso es el default, el cual siempre entrara cuando las anteriores condicionales sean falsas. Se aplica el respectivo descuento.

### Ejercicio 2

Escriba un programa para determinar si un solicitante puede lograr un préstamo. Deberá pedir los siguientes datos para cada solicitante: Nombre, historia crediticia(‘b’buena o ‘m’ mala), cantidad pedida salario anual, y valor de otras propiedades. El banco solo considerará a los solicitantes con un estado de crédito bueno. De aquellos, solo aceptara los que tengan mas de 6 puntos. Los puntos se obtienen como sigue: 5 puntos si el salario es 50% del préstamo o más.  3 puntos si el salario es por lo menos 25% pero menos de 50% del préstamo.  1 punto si el salario es por lo menos 10% pero menos de 25% del préstamo.  5 puntos si se tiene otra propiedad del doble del préstamo o mas.  3 puntos si se tiene otra propiedad igual al préstamo pero menor del doble.

El código resuelto es el siguiente:

``` lisp
(defun prestamo()
    (princ "Escriba su nombre: ")
    (setq nombre (read))
    (princ "Cantidad solicitada: ")
    (setq prestamo (read))
    (princ "Salario anual: ")
    (setq salario (read))
    (princ "Valor de otras propiedades: ")
    (setq propiedades (read))
    (princ "Historia crediticia b (buena) o m (mala): ")
    (setq historia (read))
    (case historia
        (m (format t "Lo sentimos ~a, no es posible otorgar el prestamo" nombre))
        (b 
            ;calcular punto por salario
            (cond
                ((and (>= salario (* 0.10 prestamo)) (< salario (* 0.25 prestamo))) (setq puntos 1))
                ((and (>= salario (* 0.25 prestamo)) (< salario (* 0.50 prestamo))) (setq puntos 3))
                (t (setq puntos 5))                
            )
            ;calcular puntos por propiedades
            (cond 
                ((and (>= propiedades prestamo) (< propiedades (* prestamo 2))) (setq puntos (+ puntos 3)))
                ((>= propiedades (* prestamo 2))  (setq puntos (+ puntos 5)))
            )
            (if (> puntos 6) 
                (format t "Felicidades ~a, prestamo valido" nombre) 
                (format t "Lo sentimos ~a, no es posible otorgar el prestamo" nombre)
            )
        )
        (otherwise (format t "~a No es una opcion para historia creditiica" historia))
    )    
)
```
Para este ejercicio, se utilizaron estructuras de control anidadas. 

Primero, se pide al usuario su nombre, cantidad solicitada, salario anual, valor de otras propiedades, y si la historia creditica es buena (b) o mala (m).

Luego se utiliza un **case** como estructura de control principal, en donde se determina si el valor de la historia crediticia es **b**, **m** o si se ingresó una letra que no es valida.

Si el valor es **m** se termina la ejecución del programa indiciando que no es posible otorgar el prestamo.

Si el valor es **b** entonces se ejecuta una **función cond** para calcular los puntos. Primero se hacen los rangos para el salario.

``` lisp
(cond 
    ((and (>= salario (* 0.10 prestamo)) (< salario (* 0.25 prestamo))) (setq puntos 1))
    ((and (>= salario (* 0.25 prestamo)) (< salario (* 0.50 prestamo))) (setq puntos 3))
    (t (setq puntos 5))  
)
```
Dependiendo del rango en el que entra, se le asignara un valor de puntos distinto, este valor se guarda en la variable **puntos**

Segundo, se hace el rango para calcular los puntos por propiedades.

``` lisp
(cond 
    ((and (>= propiedades prestamo) (< propiedades (* prestamo 2))) (setq puntos (+ puntos 3)))
    ((>= propiedades (* prestamo 2))  (setq puntos (+ puntos 5)))
)
```
Dependiendo del rango en el que pertenece el valor de propiedades, se le sumara a la variable **puntos** los puntos correspondientes.

Por ultimo, se hace una comprobación para determinar si, con base a los puntos obtenidos, es posible o no otorgar el prestamo.
``` lisp
(if (> puntos 6) 
    (format t "Felicidades ~a, prestamo valido" nombre) 
    (format t "Lo sentimos ~a, no es posible otorgar el prestamo" nombre)
)
```
Se hace uso de un **if** , si es verdadero que los puntos son mayores a 6, entonces, ejecuta el mensaje "Felicidades ***nombre***, prestamo valido", si es falso ejecuta el mensaje "Lo sentimos ***nombre***, no es posible otorgar el prestamo" 

### Ejercicio 3
Escriba un programa que pida una letra minúscula, el programa deberá imprimir si la letra es una vocal (a,e,i,o,u), semivocal (y) o una consonante.

El código es el siguiente:

``` lisp
(defun ejercicio3()
    (princ "Escriba una letra MINUSCULA: ")
    (setq caracter (read-char))    
    ;Validar que sea un caracter en minuscula, descartando letras en mayuscula y simbolos especiales
    (unless (or (and (char>= caracter #\A) (char<= caracter #\Z)) (or (char< caracter #\a) (char> caracter #\z)) )
        (cond
            ((or (char= caracter #\a) (char= caracter #\e) (char= caracter #\i) (char= caracter #\o) (char= caracter #\u)) (format t "el caracter: ~c es vocal" caracter))
            ((char= caracter #\y) (format t "el caracter: ~c es semivocal" caracter))            
            (t (format t "el caracter: ~c es consonante" caracter))    
        )
    )
)
```
Primero se solicita una letra minúscula. En este caso, se lee usando la función **read-char** que permite leer un caracter. Luego se hace uso de la función **unless** que provocara que el programa siga avanzando a menos que, lo que ingreso el usuario sea una letra MAYÚSCULA O MINÚSCULA, esto se hace usando **and** para crear intervalos. Se usa #\A, con lo que podemos hacer referencia al valor ASCII del caracter A, y con ello, poder hacer los intervalos de valores ASCII admitidos.

Después se ejecuta un **cond**, el cual tiene varias condicionales. La primera es un **or** para determinar si es una **vocal**, la segunda es una comparación directa para ver si el caracter es una **semivocal**, la tercera es el caso por default que determina que el caracter es una **constante**.

### Ejercicio 4
Para determinar si un año es bisiesto o no debe de cumplir las siguiente regla: Ser divisible entre 4 y no divisible entre 100 o bien divisible entre 400.  Escriba un programa que pida como entrada el año e imprima si el año es bisiesto o no.

Código a continuación:
``` lisp
(defun ejercicio4()
    (princ "Escriba un año: ")
    (setq numero (read))
    (cond 
        ((= (mod numero 4) 0) 
            (if (or (/= (mod numero 100) 0) (= (mod numero 400) 0)) (format t "El año ~a, es bisiesto" numero) (format t "El año ~a, no es bisiesto" numero))
        )
        (t (format t "El año ~a, no es bisiesto" numero))
    )
)
```
Se obtiene el año, luego se usa **cond**, cuya primera condicional es, validar si el residuo (**mod**) de numero al dividirlo entre 4 es igual a cero. En caso de que sea verdad, se hace un **if** que determina si es bisiesto o no, dependiendo si el residuo al dividirse entre 100 es **diferente** (**/=**) de 0 ó el residuo es **igual** a cero al dividirse entre 400. Si la condición es falsa, entonces se determina que no es bisiesto.


### Ejercicio 5
Escriba un programa que pida el numero de mes (del 1 al 12 ) e imprima el numero de dias que tiene el mes, donde:

   * El mes 2 tiene 28 dias
   * Los meses 4,6,9 y 11 tienen 30 dias
   * Los meses 1,3,5,7,8,10 y 12 tienen 31 dias

Si da un mes diferente a los anteriores debera imprimir el mensaje “MES ERRONEO”.

El código es el siguiente:

``` lisp
(defun ejercicio5()
    (princ "Escriba un numero de mes: ")
    (setq mes (read))
    (cond 
        ((= mes 2)(format t "El mes ~a tiene 28 dias" mes))
        ((or (= mes 4) (= mes 6) (= mes 9) (= mes 11))(format t "El mes ~a tiene 30 dias" mes))
        ((or (= mes 1) (= mes 3) (= mes 5) (= mes 7) (= mes 8) (= mes 10) (= mes 12))(format t "El mes ~a tiene 31 dias" mes))
        (t (princ "Mes erroneo"))
    )
)
```
Se lee el mes, luego se usa un **cond**, la primera validación, es para determinar si el mes es igual a 2, la segunda tiene un **or** por si el valor del mes es 4, 6, 9 o 11, la tercera es por si el valor del mes es 1, 3, 5, 7, 8, 10 o 12. El caso por default es por si el mes ingresado es incorrecto.

## Diagrama árbol binario
Esta actividad consiste en crear un diagrama de árbol binario (que en realidad, no necesariamente debe ser binario) con varios niveles o ramificaciones, para posteriormente, crear una lista en lisp y poder recorrerla con las funciones vistas anteriormente.

La imagen completa del diagrama se encuentra en el directorio de "diagrama arbol binario"

![Diagrama arbol](diagrama_arbol_binario/arbol.jpeg)

## Prueba de escritorio sistema experto

La actividad en clase consistia en realizar una prueba de escritorio ya sea en excel o libreta, sobre una versión de eliza. El objetivo era comprender el proceso que sigue eliza cuando encuentra un template que hace match y como devuelve la respuesta.

El archivo csv se encuentra en el directorio "prueba_escritorio", puede acceder también presionando [aqui](prueba_escritorio_eliza/prueba_escritorio.xlsx)

``` lisp

```

``` lisp

```



``` lisp

```



``` lisp

```



``` lisp

```

``` lisp

```
``` lisp

```
``` lisp

```
``` lisp

```
``` lisp

```
