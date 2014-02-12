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

(define (average x y) (/ (+ x y) 2.0))

(define (average-damp f)
   (lambda (x) (average x (f x))))

(define (n-root n x)
  (define (pow x i)
    (if (= 0 i) 
         1
         (* x (pow x (- i 1))))) 
  (fixed-point (average-damp (lambda (y) (/ x (pow y (- n 1)))))
               1.0))

(define (cube x) (* x x x))

(define (derivative f)
  (define dx 0.00001)
    (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define (newton-transform f)
  (lambda (x) (- x (/ (f x) ((derivative f) x)))))
(define (newton-method f guess)
  (fixed-point (newton-transform f) guess))

(define (newton-sqrt x)
   (newton-method (lambda (y) (- (square y) x)) 
                  1.0))
