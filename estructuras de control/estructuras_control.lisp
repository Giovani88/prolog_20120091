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