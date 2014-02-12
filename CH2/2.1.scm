(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))            

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))            

(define (eq-rat x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))            

;this version is better! fixes positive/negative issues
(define (make-rat n d) 
  (let ((g (gcd n d))) 
   (cond ((and (> n 0) (< d 0))
           (cons (/ (- n) g)  (/ (- d) g)))
         ((and (< n 0) (< d 0))
           (cons (/ (- n) g)  (/ (- d) g)))
         (else 
           (cons (/ n g)  (/ d g))))
   ))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

