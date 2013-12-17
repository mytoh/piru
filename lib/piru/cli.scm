
(define-module piru.cli

  (export run)
  (use util.match)
  (use piru.command)

  (begin

    (define (run args)
      (let ((command (cadr args))
            (rest (cddr args)))
        (match command
          ("service"
           (service rest)))))

    ))
