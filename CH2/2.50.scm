;using the transform-painter, define flip-horiz
;and also ones that flip by 180 or 270 degrees

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vec 1.0 0)     ;new origin
                     (make-vec 0 0)       ;new edge1
                     (make-vec 1.0 1.0))) ;new edge2

(define (rot-180 painter)
  (transform-painter painter
                     (make-vec 1.0 1.0 )   ;
                     (make-vec   0 1.0 )   ;
                     (make-vec 1.0   0 ))) ;

;(note : this is counterclockwise!)
(define (rot-270 painter)
  (transform-painter painter
                     (make-vec 1.0 0.0 )   ;
                     (make-vec   0 1.0 )   ;
                     (make-vec 1.0   0 ))) ;
