;define the proc. up-split used by corner split

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
           (below painter (beside smaller smaller)))))

(define (split first second)
  (define (split-iter painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-iter painter (- n 1))))
             (first painter (second smaller smaller)))))
  (lambda (p n) (split-iter p n))) 
