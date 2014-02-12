;Sets as Ordered lists

;this will not change!
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        ((< x (car set) #f))
        (else (element-of-set? x (cdr set)))))

;the test for x < (car set) save about a factor of 2 (on average)

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define numset '(1 3 4 5 8))

;this becomes simpler, too? no. - doesn't need to change
(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2)) 
      '()
      (let ((x1 (car set1)) (x2 (car set2))) 
        (cond ((= x1 x2)
                 (cons  x1
                       (intersection-set (cdr set1) (cdr set2))))
              ((< x1 x2)
                 (intersection-set (cdr set1) set2))
              ((> x1 x2)
                 (intersection-set set1 (cdr set2)))))))
           
;give an O(n) implementation of Union-set, similar to above

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                ((< x1 x2) (cons x1 (union-set (cdr set1) set2))) 
                ((> x1 x2) (cons x2 (union-set set1 (cdr set2)))))))))

(define numset2 '(2 3 4 5 6))

