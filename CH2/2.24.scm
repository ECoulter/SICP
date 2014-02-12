(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

;for expression (list 1 (list 2 (list 3 4)))
; interpreter gives: (1 (2 (3 4)))
; box-and-pointer: [(1) -> ] [(2) ->]  [ [(3) ->] [(4) /] ] 
;tree:  .
;      / \
;     1  /\
;       2 /\
;        3  4
