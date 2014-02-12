;Church numerals... implement all numbers using 0 and +1

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) 
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (plus a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define (inc x) (+ x 1))
