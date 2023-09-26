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
