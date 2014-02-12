(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)            ; for each x in s
                 (map (lambda (p) (cons x p)) ; create (list s p)
                      (permutations (remove x s)))) ;where p is permutation
               s)))                                 ; of the set (s-x)

(define (test s)
  (map (lambda (x)            
          (map (lambda (p) (cons x p)) 
                (test (remove x s)))) 
       s))

(define (remove item s)
  (filter (lambda (x) (not (= x item))) s))
