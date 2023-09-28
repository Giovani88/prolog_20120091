;Ejercicio 1 (load "estructuras_control") 
; x < 5 precio normal,   5 <= x < 12, 15% en cada pantalon, x >=12 30%

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