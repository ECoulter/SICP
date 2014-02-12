
(import (ikarus))
(import (rnrs))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (next n)
   (if (= n 2) 
          3
          (+ 2 n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n))

(define ( start-prime-test n)
  (if (prime? n)
      (time (prime? n))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (rangedprimes first last)
   (define (search cur last)
      (if (<= cur last) (if (prime? cur) (timed-prime-test cur)))
      (if (<= cur last) (search (+ 2 cur) last)))
   (search (if (even? first) (+ 1 first) first)
           (if (even? last) (- last 1) last)))
                                         
      

(rangedprimes 1000000000000 1000000000090)
