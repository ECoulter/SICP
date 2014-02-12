;Sets as unordered lists
;now, allow duplicates in our sets...

;this will not change!
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

;now, this changes? stupid
(define (adjoin-set x set)
      (cons x set))

;this becomes simpler, too? no. - doesn't need to change
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
           (cons (car set1)
                 (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;given the above, define union set1 set2

;now, this is really simple (I think)
(define (union-set set1 set2)
  (append set1 set2))

(define seta '(a b c d e))
(define setb '(f g e a q))

;this is more efficient when adding or adding-on to a set
;however, could also require more memory
