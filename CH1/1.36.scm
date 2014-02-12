(define tolerance 0.00001)
(define (fixed-point-print f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "Guess = ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (one-thou-root x)
  (fixed-point-print (lambda (y) (/ (log 10000) (log y)))
               x))

(define (average x y) (/ (+ x y) 2.0))

(define (damp-one-thou-root x)
  (fixed-point-print (lambda (y) (average y (/ (log 10000) (log y))))
               x))
