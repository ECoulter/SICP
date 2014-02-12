(define (deep-reverse x)
    (if (pair? x)
        (append (deep-reverse (cdr x))
              (list (deep-reverse (car x)) ))
         x))

;arranges the leaves on a tree into left-right order
(define (fringe x)
  (if (pair? x)
      (if (null? (cdr x))
          (fringe (car x))
          (append (fringe (car x)) (fringe (cdr x))))
      (list x)
  )
)
