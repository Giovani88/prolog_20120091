(defun recorre(lista item)
    (if (eq (car lista) item)
        (format t "El elemento ~A existe en la lista." item)
    )
    (if lista
        (recorre (cdr lista) item)
    )
)
