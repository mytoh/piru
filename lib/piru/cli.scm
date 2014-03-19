
(define-library (piru cli)
    (export run)
  (import
    (scheme base)
    (gauche base)
    (util match)
    (piru command))

  (begin

    (define (run args)
      (let ((command (cadr args))
            (rest (cddr args)))
        (match command
               ("service"
                (service rest)))))

    ))
