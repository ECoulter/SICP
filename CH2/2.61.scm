;Sets as Ordered lists

;this will not change!
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        ((< x (car set) #f))
        (else (element-of-set? x (cdr set)))))

;the test for x < (car set) save about a factor of 2 (on average)

;this is a really bad design
(define (adjoin-set x set)
  (define (loop small big)
    (cond ((null? big) (append small (list x)))
          ((< x (car big))
           (append small (cons x big)))
          (else (loop (append small (list (car big))) (cdr big)))))
  (if (< x (car set)) (cons x set)
      (loop (list (car set)) (cdr set))))

;this one is much prettier!
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
           
;this is more efficient when adding or adding-on to a set
;however, could also require more memory
