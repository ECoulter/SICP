(define (square x) (* x x))

;point library
(define (make-point x y)
   (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (dist p1 p2)
  (sqrt (+ (square (abs (- (x-point p1) (x-point p2))))
           (square (abs (- (y-point p1) (y-point p2))))
        )))

;segment library

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-seg s)
  (car s))

(define (end-seg s)
  (cdr s))

(define (seg-len s)
  (dist (start-seg s) (end-seg s)))

(define (dot s1 s2)
  (+ (* (- (x-point (end-seg s1)) (x-point (start-seg s1)))
        (- (x-point (end-seg s2)) (x-point (start-seg s2)))
     )
     (* (- (y-point (end-seg s1)) (y-point (start-seg s1)))
        (- (y-point (end-seg s2)) (y-point (start-seg s2)))
     )
  ))
        

(define (average x y) (/ (+ x y) 2.0))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

;rectangles 1
(define (make-rect p1 p2)
  (cons p1 p2))

(define (bottom-left r)
  (car r))

(define (top-right r)
  (cdr r))

(define (height r)
  (abs (- (x-point (bottom-left r)) (x-point (top-right r)))))

(define (len r)
  (abs (- (y-point (bottom-left r)) (y-point (top-right r)))))

;rectangles 2
;should check that segments are perpendicular!
(define (make-rect2 s1 s2)
  (if ( = 0 (dot s1 s2))
      (cons s1 s2)
      (display "Segments Not Perp!")
  )
)

(define (side1 r)
  (car r))

(define (side2 r)
  (cdr r))

(define (height2 r)
  (seg-len (side1 r)))

(define (len2 r)
  (seg-len (side2 r)))

;area and perimeter
(define (area r)
  (* (len r) (height r)))

(define (perim r)
  (+ (* 2.0 (len r)) (* 2.0 (height r))))

(define (area2 r)
  (* (len2 r) (height2 r)))

(define (perim2 r)
  (+ (* 2.0 (len2 r)) (* 2.0 (height2 r))))
