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


;for a range of integrals

(define (enumer-interval low high)
  (if (> low high)
      nil
      (cons low (enumer-interval (+ low 1) high))))

(define (enumer-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumer-tree (car tree))
                      (enumer-tree (cdr tree))))))

(define (sum-odd-squares tree)
  (accumulate +
              0
              (map square 
                   (filt odd?
                         (enumer-tree tree)))))

(define (even-fibs n)
  (accumulate cons
              nil
              (filt even?
                    (map fib
                         (enumer-interval 0 n)))))

(define (fib-squares n)
  (accumulate cons
              nil
              (map square
                   (map fib 
                        (enumer-interval 0 n)))))

(define (odd-squares-prod seq)
  (accumulate *
              1
              (map square
                   (filt odd?
                         seq))))


