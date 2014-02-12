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

;define accumulate-n to take lists and accumulate them...
;so that the result of
(define test-seqs (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
;(accumulate-n + 0 test-seqs)
;is
;(22 26 30)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;(this is essentially summing up rows in a matrix...)

;for matrices defined liks (list (row1) (row2) ...), define the 
;following operations

(define test-vec (list 1 2 3))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (scal-product v a)
  (map (lambda (x) (* x a)) v))

(define (matrix-*-vector m v)
  (map (lambda (m-row) (dot-product v m-row)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
     (map (lambda (m-row) (matrix-*-vector cols m-row)) m)))
