;accumulate is an example of fold-right

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
;(op (op (op init 1) 2) 3)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;(op 1 (op 2 (op 3 init)))

(define (reverse1 sequence)
  (accumulate (lambda (x y) (append y (list x))) nil sequence))
(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
