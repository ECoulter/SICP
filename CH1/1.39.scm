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


(define (tan-cf x k)
  (cont-frac
     (lambda (i) (if (= i 1) x (- (* x x))))
     (lambda (i) (- (* 2.0 i) 1))
     k
  )
)


