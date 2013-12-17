(define-module piru.command.service

  (export service)

  (use util.match)
  (use gauche.process)

  (begin

    (define (service args)
      (match (car args)
        ("all"
         (all-service))
        ("active"
         (active-service))))

    ;;; util
    (define (service-command opt)
      (process-output->string-list (append '(service) (list opt))))

    ;;; active service
    (define (active-service)
      (active-print-service
       (active-list-services)))

    (define (active-list-services)
      (let ((services (service-command '|-e|)))
        (map
            (lambda (p)
              (sys-basename p))
          services)))

    (define (active-print-service services)
      (for-each
          (lambda (p)
            (display p)
            (newline))
        services))

    ;;; all service

    (define (all-service)
      (for-each
          print
        (service-command '|-l|)))

    ))
