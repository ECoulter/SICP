;add smiley to wave painter
;in list of segments, insert something like this

(make-segment (make-vec 0.35 0.45) (make-vec (0.4 0.4)))
(make-segment (make-vec 0.4 0.4) (make-vec (0.45 0.45)))

;change pattern constructed by corner-split to use only 1 
;copy of up-split and right-split
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

;modify version  of square-limit that uses square-of-four
;to make Rogers look outward (he looks to the left)

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity  flip-horiz
                                  flip-vert rotate-180)))
    (combine4 (corner-split painter n))))
