;gnu clisp  2.49.60
(defun recorre(lista)
     (princ (car lista))
      (if (> (length lista) 0)
       (recorre (cdr lista))
)
     
)

(recorre '(1 2 3 4 5))