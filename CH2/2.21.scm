(define (square x) (* x x))

;filled in these definitions from the text given:
;(define (square-list items)
;  (if (null? items)
;      '()
;      (cons <??> <??>)))
;
;(define (square-list-2 items)
;  (map <??> <??>))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-2 items)
  (map square items))
