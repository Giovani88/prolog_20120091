(defun primerLista()
    (setq lista1 '(1 2 3 4 (a b c) (c d e)))
    ;1
    (print (car lista1))
    ;A
    (print (caar (cddddr lista1)))
    ;C
    (print (caadr (cddddr lista1)))
)

(defun segundaLista()
    (setq lista2 '((((a b c) 5) 6) 7 (8 9 10)))
    ;a 
    (print (caaaar lista2))
    ;b
    (print (car (cdaaar lista2)))
    ;c
    (print (cadr (cdaaar lista2)))
    ;5
    (print (cadaar lista2))
    ;6
    (print (cadar lista2))
    ;7
    (print (cadr lista2))
    ;8
    (print (caaddr lista2))
    ;9
    (print (car (cdaddr lista2)))
    ;10
    (print (cadr (cdaddr lista2)))

)