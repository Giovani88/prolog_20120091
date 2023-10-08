;(load "lambda.lisp")
(defvar *area_rectangulo* (lambda (a b) (* a b)))
(defvar *area_triangulo* (lambda (altura base) (/ (* altura base) 2)))
(defvar *area_circulo* (lambda (radio) (* radio radio 3.1416)))
(defvar *area_rombo* (lambda (d1 d2) (/ (* d1 d2) 2)))
(defvar *area_trapecio* (lambda (b1 b2 altura) (/ (* (+ b1 b2) altura) 2)))
(defvar *area_cometa* (lambda (d1 d2) (* (/ d1 2) d2)))
(defvar *area_poligono_regular* (lambda (numero_lados lado) 
        (setq angulo (/ 360 (* 2 numero_lados)))
        (setq apotema (/ lado (* 2 (tan (/ (* angulo 3.1416) 180)))))
        (/ (* apotema numero_lados lado) 2)
    )
)
(defvar *area_corona_circular* (lambda (r r2) (* 3.1416 (- (* r r) (* r2 r2)))))
(defvar *area_sector_circular* (lambda (angulo radio) (/ (* 3.1416 radio radio angulo) 360)))