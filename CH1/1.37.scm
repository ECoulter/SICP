(define tolerance 0.00001)
(define (fixed-point-print f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "Guess = ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (cont-frac n d k) 
  (define (frac-iter i frac)
   (if (= i 0) 
         frac
         (frac-iter (- i 1) (/ (n i) (+ (d i) frac)))))
  (frac-iter k 0)
)


; incorrect for a really i dependent k!
(define (cont-frac2 n d k) 
  (cond ((= k 1) (/ (n 1) (d 1)))
         (else (/ (n k) (+ (d k) (cont-frac2 n d (- k 1)) )))))

;this one works if you define functions for n and d dependent on i
(define (cont-frac3 n d k) 
  (define (rec-frac i)
  (cond ((= i k) (/ (n i) (d i)))
         (else (/ (n i) (+ (d i) (rec-frac (+ i 1)) )))))
  (rec-frac 1.0))

(define (cont-frac4 n d k) 
  (if  (= k 0) 
          0 
         (/ (n k) (+ (d k) (cont-frac4 n d (- k 1)) ))))

