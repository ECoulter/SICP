(define (inc x) (+ x 1))

(define (double f) 
;this should apply f(x) twice : double(f(x)) = f(f(x))
  (lambda (x) (f (f x)))
)
