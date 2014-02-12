(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

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

(define (repeated f n)
  (if (= 1 n)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))
  )
)

(define (average-damp f)
   (lambda (x) (average x (f x))))

(define (n-fold-average-damp f n)
   (repeated average-damp n) f)

(define (n-fold-average-damp2 n)
   (repeated average-damp n))

(define (average x y) (/ (+ x y) 2.0))

(define (bad-root n x)
  (define (pow x i)
    (if (= 0 i) 
         1
         (* x (pow x (- i 1))))) 
  (define n-avg (floor (/ (log n) (log 2))))
  (fixed-point ((n-fold-average-damp2  n-avg) (lambda (y) (/ x (pow y (- n 1)))))
               1.0))

(define (sqroot x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (n-root n x m)
  (define (pow x i)
    (if (= 0 i) 
         1
         (* x (pow x (- i 1))))) 
  (fixed-point (n-fold-average-damp (lambda (y) (/ x (pow y (- n 1))))
                                    m
               )
               1.0))
