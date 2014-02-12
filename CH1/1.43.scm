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
