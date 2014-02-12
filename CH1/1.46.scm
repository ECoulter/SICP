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

(define (average x y) (/ (+ x y) 2.0))

(define (improve guess x)
   (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x)
                  x)))

(define (average x y) (/ (+ x y) 2.0))

(define (square x) (* x x))

(define (good-enough? guess x) 
   (< (abs (- (square guess) x)) 0.0001))

(define (sqroot x)
  (fixed-point (lambda (y) (* 0.5 (+ y (/ x y))))
               1.0))

;re-write both fixed-point and the sqrt-iter using the new
;iterative-improve method!

(define (iterative-improve test? improve)
  (define (improve-iter x)
     (if (test? x (improve x)) 
          (improve x)
          (improve-iter (improve x))))
  (lambda (x) (improve-iter x)))

;note: the number you want to find the function of should ONLY
;be visible in the new sqrt-routine - other things that use
;iterative-improve may only have one argument!
;ONLY the guess-variable should be used by the final iterative-improve
;procedure.
(define (new-sqrt x)
   ((iterative-improve close? (lambda (y) (average y (/ x y)))) 1.0))

(define (new-fixed-point f)
  ((iterative-improve close? f) 1.0))

(define (close? v1 v2)
  (< (abs (- v1 v2)) tolerance))  
