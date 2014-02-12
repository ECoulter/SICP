;define a below procedure, similar to beside given in SICP
; then, do it in terms of rotations and beside!

(define (below painter1 painter2)
  (let ((split-point (make-vec 0 0.5)))
    (let ((paint-bottom
           (transform-painter painter1
                              (make-vec 0.0 0.0)
                              (make-vec 1.0 0.0)
                              split-point))
          (paint-top
           (transform-painter painter1
                              split-point
                              (make-vec 1.0 0.5)
                              (make-vec 0.0 1.0))))
    (lambda (frame)
      (paint-top frame)
      (paint-right frame)))))

;2nd method

(define (below painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))
;this requires that rotate270 is clockwise as well!
