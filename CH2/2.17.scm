(define (last-pair x)
  (if (null? (cdr x))
      (list (car x))
      (last-pair (cdr x))))
