(import (rnrs))


(define (square x) (* x x))

(define (expmod base pow m)
  (cond ((= pow 0) 1)
        ((even? pow)
         (remainder (square (expmod base (/ pow 2) m)) m))
        (else 
         (remainder (* base (expmod base (- pow 1) m))
                    m))))

 (define (carm-test n)
   (carm-search n (- n 1)))
  (define (carm-search n m)
    (cond ((= m 0) #t) 
          ((= (expmod m n n) m) (carm-search n (- m 1)))
          (else #f)))


 (define (carm-check n)
         (if (and (carm-test n) (prime? n)) 
             (display n "is carmichael number!")))

(must include prime? from 1.23!)
