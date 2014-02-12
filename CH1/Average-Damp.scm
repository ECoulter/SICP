(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqroot x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (square x) (* x x))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))


(define (n-root n x)
  (define (pow x i)
    (if (= 0 i) 
         1
         (* x (pow x (- i 1))))) 
  (fixed-point (average-damp (lambda (y) (/ x (pow y (- n 1)))))
               1.0))

(define (average-damp f)
   (lambda (x) (average x (f x))))

(define (average x y) (/ (+ x y) 2.0))
