;for these two constructore, supply selectors appropriately
;(not naked)

(load "2.46.scm")

;constructor 1
(define (make-frame1 origin edge1 edge2) 
  (list origin edge1 edge2))

(define (origin-frame1 frame)
  (car frame))
 
(define (edge1-frame1 frame)
  (car (cdr frame)))

(define (edge2-frame1 frame)
  (car (cdr (cdr frame))))

(define test1 (make-frame1 (make-vec 1 2) (make-vec 0 2) (make-vec 2 0)))

;constructor 2
(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))
 
(define (edge1-frame2 frame)
  (car (cdr frame)))

(define (edge2-frame2 frame)
  (cdr (cdr frame)))

(define test2 (make-frame2 (make-vec 1 2) (make-vec 3 1) (make-vec 0 4)))
