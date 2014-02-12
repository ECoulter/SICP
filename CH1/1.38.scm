(define (cont-frac n d k) 
  (define (frac-iter i frac)
   (if (= i 0) 
         frac
         (frac-iter (- i 1) (/ (n i) (+ (d i) frac)))))
  (frac-iter k 0)
)


;this one works if you define functions for n and d dependent on i
(define (cont-frac-rec n d k) 
  (define (rec-frac i)
  (cond ((= i k) (/ (n i) (d i)))
         (else (/ (n i) (+ (d i) (rec-frac (+ i 1)) )))))
  (rec-frac 1.0))


(define (euler-e k)
  (define (n i) 1.0)
  (define (d i) 
     (cond ((= 2 (remainder i 3)) (/ (+ 1 i) 1.5))
           (else 1.0)
     )
  )
  (+ 2 (cont-frac-rec n d k))
)


