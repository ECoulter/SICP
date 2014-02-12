;define constructor & selectors for line segments
;using start and end vectors 

(define (make-segment start end)
  (list start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cadr seg))

