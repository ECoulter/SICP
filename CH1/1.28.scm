#!/usr/bin/guile
!#

(import (rnrs))


(define (square x) (* x x))

(define (rm-expmod base pow m)
  (define (square-check x)
    (define (check-nontrivial x square)
     (if (and (= square 1)
              (not (= x 1))
              (not (= x m)))
         0 
         square))
     (check-nontrivial x (remainder (square x) m)))

  (cond ((= pow 0) 1)
        ((even? pow)
         (remainder (square-check (rm-expmod base (/ pow 2) m)) m))
        (else 
         (remainder (* base (rm-expmod base (- pow 1) m))
                    m))))

 (define (rm-test n)
   (rm-search n (- n 1)))
  (define (rm-search n m)
    (cond ((= m 0) #t) 
          ((= (rm-expmod m (- n 1) n) 1) (rm-search n (- m 1)))
          ((= (rm-expmod m (- n 1) n) 0) #f)
          (else 3)))
(display "Here!")
(newline)
(display (rm-test 1))
(newline)
(display (rm-test 5))
(newline)
(display (rm-test 8))
(newline)
(display (rm-test 561))
(newline)
(display (rm-test 563))
(newline)
(display "Here!")
(newline)
