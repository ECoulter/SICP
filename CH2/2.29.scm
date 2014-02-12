(define (make-mobile left right)
  (cons left right))

(define (make-branch len struct)
  (cons len struct))
;(define (make-mobile left right)
;  (list left right))

;struct is either a number or another branch
;(define (make-branch len struct)
;  (list len struct))

(define test (make-mobile
                          (make-branch 2 (make-mobile
                                                      (make-branch 1 3)
                                                      (make-branch 1 3)))
                          (make-branch 3 4)))
;should be balanced - total weight = 10
(define smalltest (make-mobile (make-branch 1 3)
                               (make-branch 1 3)))

(define badtest1 (make-mobile
                          (make-branch 2 (make-mobile
                                                      (make-branch 1 3)
                                                      (make-branch 1 3)))
                          (make-branch 3 5)))

(define badtest2 (make-mobile
                          (make-branch 2 (make-mobile
                                                      (make-branch 1 3)
                                                      (make-branch 1 4)))
                          (make-branch 3 4)))

;(a) write selectors left-branch and right-branch, and branch-len / branch-struct

(define (left-branch b)
  (car b))

(define (right-branch b)
;  (cadr b))
  (cdr b))

(define (branch-len b)
  (car b))

(define (branch-struct b)
;  (cadr b))
  (cdr b))

;(b) define total-weight, which returns total weight of the mobile!

(define (is-mobile? struct)
  (pair? struct))

(define (total-weight mobile)
 (+
  (if (is-mobile? (branch-struct (left-branch mobile)))
      (total-weight (branch-struct (left-branch mobile)))
      (branch-struct (left-branch mobile)))
  (if (is-mobile? (branch-struct (right-branch mobile)))
      (total-weight (right-branch mobile))
      (branch-struct (right-branch mobile)))
 )
)

;(c) design a predicate to test if a mobile is balanced - that is,
;    if for each mobile, the dist*weight of each branch is equal. 
;    (this must also hold true for sub-mobiles?)

(define (balanced? mobile)

  (define (torq branch)
;find torq on this particular branch
    (if (is-mobile? (branch-struct branch))
        (* (branch-len branch) (total-weight (branch-struct branch)))
        (* (branch-len branch) (branch-struct branch))))
;nested AND for each branch
  (and (= (torq (left-branch mobile))
          (torq (right-branch mobile)))
;if more branches, repeat balanced? - if a leaf is reached, return #t 
       (if (is-mobile? (branch-struct (left-branch mobile)))
           (balanced? (branch-struct (left-branch mobile)))
           #t)

       (if (is-mobile? (branch-struct (right-branch mobile)))
           (balanced? (branch-struct (right-branch mobile)))
            #t)))

;(d) suppose we change now to 

(define (make-mobile left right)
  (cons left right))

(define (make-branch len struct)
  (cons len struct))

;how much change is needed?

;must change right-branch and branch-struct! they use cadr if list, and 
; cdr if cons. 


(define level-1-mobile (make-mobile (make-branch 2 1) 
                                     (make-branch 1 2))) 
 (define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                     (make-branch 9 1))) 
 (define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                     (make-branch 8 2))) 
  
