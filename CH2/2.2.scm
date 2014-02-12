(define (make-point x y)
   (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-seg s)
  (car s))

(define (end-seg s)
  (cdr s))

(define (average x y) (/ (+ x y) 2.0))

(define (midpoint s)
  (make-point (average (x-point (start-seg s)) (x-point (end-seg s)))
              (average (y-point (start-seg s)) (y-point (end-seg s)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))
