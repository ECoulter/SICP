(import (rnrs))


(define (square x) (* x x))

(define (expmod base pow m)
  (cond ((= pow 0) 1)
        ((even? pow)
         (remainder (square (expmod base (/ pow 2) m)) m))
        (else 
         (remainder (* base (expmod base (- pow 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n ) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fermat-prime n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fermat-prime n (- times 1)))
        (else #f)))

(fermat-prime 1000000009 10)
