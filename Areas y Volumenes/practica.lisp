
(defun area_triangulo()
   (princ "Escriba la base: ")
   (setq base (read))
   (princ "Escriba la altura: ")
   (setq altura (read))
   (write  (/ (* base altura) 2))
)
;(area_triangulo)

(defun area_rectangulo()
   (princ "Escriba la base: ")
   (setq base (read))
   (princ "Escriba la altura: ")
   (setq altura (read))
   (write  (* base altura))
)

;(area_rectangulo)

(defun area_cuadrado()
   (princ "Escriba un lado: ")
   (setq lado (read))
   (write (* lado lado))
)

;(area_cuadrado)

(defun area_circulo()
  (princ "Escriba el radio: ")
  (setq radio (read))
   (write (* radio radio 3.1416))
)

;(area_circulo)

(defun area_rombo()
  (princ "Escriba D: ")
   (setq d1 (read))
   (princ "Escriba d: ")
   (setq d2 (read))
   (write (/ (* d1 d2) 2))
)

;(area_rombo)