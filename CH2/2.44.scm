;define the proc. up-split used by corner split

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
           (below painter (beside smaller smaller)))))
