(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) #nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (map-square-tree tree) 
  (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (map-square-tree sub-tree)
              (square sub-tree)))
       tree))

(define tree-test (list 1 
                        (list 2 (list 3 4) 5) 
                        (list 6 7)))


