(define nil '())

(define (square x) (* x x))

(define (fib n)
  (define (iter fin prev i)
     (if (= 0 i)
         fin
         (iter (+ fin prev) fin (- i 1))))
  (iter 0 1 n))

(define (filt predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filt predicate (cdr sequence)))) 
        (else (filt predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


;coeff = coefficients; seq = sequence
;this starts from the a0 coeff!
(define (horner-eval x coeff-seq)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff  
                                                   (* x higher-terms)))
              0
              coeff-seq))
