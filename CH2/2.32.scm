;to generate the set of all subsets, use the following (I filled in the
;definition from the book!

;The set of all subset is the Union of:
;   The set of all subsets excluding the first element
;   And the set of all subsets excluding the 1st - with 1st element reinserted

;For example : (subsets (3)) = ( () ) U ( (3) )
;For example : (subsets (2 , 3)) = ( (2), () ) U ((2 , 3) , (3) )

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
           (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define (identity x) x)
