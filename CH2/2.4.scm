(define (con x y)
  (lambda (m) (m x y)))

(define (ca z)
  (z (lambda (p q) p)))

(define (cd z)
  (z (lambda (p q) q)))

(ca (con x y))

becomes 

(ca (lambda (m) (m x y)))

becomes 

(lambda (m) (m x y) (lambda (p q) p))

becomes

((lambda (p q) p) x y)

becomes 

x
.
