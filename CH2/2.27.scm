(define (my-reverse x)
  (define (inner-reverse x y)
     (if (null? x)
         y
         (inner-reverse (cdr x) (cons (car x) y))
     ))
  (inner-reverse x #nil ))

(define (deep-reverse x)
    (if (pair? x)
        (append (deep-reverse (cdr x))
              (list (deep-reverse (car x)) ))
         x))
