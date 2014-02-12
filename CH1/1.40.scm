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

(define (derivative f)
  (define dx 0.00001)
    (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define (newton-transform f)
  (lambda (x) (- x (/ (f x) ((derivative f) x)))))
(define (newton-method f guess)
  (fixed-point (newton-transform f) guess))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c) 
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
