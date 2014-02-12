;represent pair of non-negative integers as a pair using only
; the integer = 2^a * 3^b

(define (timesnum x n)
  (if (= n 0)
      1
      (* x (timesnum x (- n 1))))) 

(define (numdivides x n)
  (if (= (remainder x n) 0)
      (+ 1 (numdivides (/ x n) n))
      0))

(define (conpair a b)
  (* (timesnum 2 a) (timesnum 3 b)))

(define (carpair z)
  (numdivides z 2) )

(define (cdrpair z)
  (numdivides z 3) )

;COULD HAVE USED LOG INSTEAD.
