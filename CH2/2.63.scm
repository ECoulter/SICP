(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (build-tree n set)
  (if (or (> n 5) (= n 0))
        set 
       (adjoin-set n (build-tree (- n 1) set))))

(define test-tree-set '(3 (2 (1 () ()) () ) (4 (5 () ()) (6 () (7 () ()))))) 

(define (tree->list-1 tree)
  (if (null? tree)
       '()
       (append (tree->list-1 (left-branch tree)) 
               (cons (entry tree)
                     (tree->list-1
                       (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree) 
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                             (copy-to-list 
                               (right-branch tree)
                               result-list)))))
  (copy-to-list tree '()))

;For the trees in Fig 2.16, we get the lists

 ;a. (1 3 5 7 9 11)
 ;b. (1 3 5 7 9 11)
 ;c. (1 3 5 7 9 11)

 ;The first f'n is of order O(n * log n) - thanks to Append taking (log n) time.
 ;The 2nd f'n is of order O(n)
