;(define (segments->painter segment-list)
;  (lambda (frame)
;    (for-each
;     (lambda (segment)
;       (draw-line
;        ((frame-coord-map frame) (start-segment segment))
;        ((frame-coord-map frame) (end-segment segment))))
;     segment-list)))

;use segments-painter for the following

;painter that draws the outline of the frame
(define (outline frame)
  ((segments->painter (list (make-segment (make-vec 0 0) (make-vec 1 0))
                            (make-segment (make-vec 1 0) (make-vec 1 1))
                            (make-segment (make-vec 1 1) (make-vec 0 1))
                            (make-segment (make-vec 0 1) (make-vec 0 0))))
   frame))

;painter that draws an x across opposite corners of the frame
(define (x-the-spot frame)
  ((segments->painter (list (make-segment (make-vec 0 0) (make-vec 1 1))
                            (make-segment (make-vec 0 1) (make-vec 1 0))))
   frame))

;draws a diamond
(define (outline frame)
  ((segments->painter (list (make-segment (make-vec 0.5 0)   (make-vec 1   0.5))
                            (make-segment (make-vec 1   0.5) (make-vec 0.5 1))
                            (make-segment (make-vec 0.5 1)   (make-vec 0   0.5))
                            (make-segment (make-vec 0   0.5) (make-vec 0.5 0))))
   frame))

;the "wave" painter... not useful to do this! just a list of points. 
