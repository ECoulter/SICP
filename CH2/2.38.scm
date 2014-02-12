;accumulate is an example of fold-right

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;fold-left goes from left-to right in a sequence

;what are the values of:
;(fold-right / 1 (list 1 2 3)) -> 3/2 = (/ 1 (/ 2 (/ 3 1)))
;(fold-left / 1 (list 1 2 3)) -> 1/6 = (/ (/ (/ 1 1) 2) 3)
;(fold-right list nil (list 1 2 3)) -? (1 (2 (3 ())))
;(fold-left list nil (list 1 2 3)) -> (((() 1) 2) 3)

;op should be the same for (op a init) (op init a)
; note - matrix multiplication will have this property, since the
; identity matrix is non-directional in multiplication! 
