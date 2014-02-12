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

;define count-leaves as an accumulation
(define (count-leaves2 tree)
  (accumulate (lambda (x y) (+ (length x) y))
              0
              (map tree-to-seq tree)))

(define (tree-to-seq tree)
  (if (null? tree)
      nil
  (if (not (pair? tree))
      (list tree)
      (append (tree-to-seq (car tree))
              (tree-to-seq (cdr tree))))))

(define (count-leaves3 tree)
  (accumulate +
              0
              (map (lambda (node) (if (pair? node)
                                      (count-leaves3 node)
                                      1))
                   tree)))

(define test-tree (list (list 1 2) (list 2 (list 3 4) 5)))
