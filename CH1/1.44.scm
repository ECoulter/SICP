(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))
  )
)

;define a function "smooth" to return (average f(x - dx), f(x), f(x + dx))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3.0)
  )
)

(define (n-fold-smooth f n)
   (repeated smooth n) f)
