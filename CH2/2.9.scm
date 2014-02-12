(define (par-add r1 r2) 
   (/ 1 (+ (/ 1 r1) (/ 1 r2))))
;have to redefine this to handle intervals...

(define (bounds r p)
  (if (> 1.0 p)
       (display "BAD PERCENTAGE IN p")
       (make-interval (- r (* r p)) (+ r (* r p)))))  

(define (add-interval a b) 
  (make-interval (+ (lower-bound a) (lower-bound b))
                 (+ (upper-bound a) (upper-bound b))))

(define (sub-interval a b) 
  (make-interval (- (lower-bound a) (lower-bound b))
                 (- (upper-bound a) (upper-bound b))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
               (make-interval (/ 1.0 (upper-bound y))
                              (/ 1.0 (lower-bound y)))))

(define (width x)
  (/ (abs (- (upper-bound x) (lower-bound x))) 2.0))

;When adding or subtracting, width = width(a) +/- width(b) (associative!)
;when multiplying or dividing, not true; depends on bounds:
; width(mul (1,2) (2,3)) = width(2,6) != 1*1
; width(div (1,2) (2,3)) = width(1/2,2/3) != 1/1

(define (make-interval a b)
  (cons a b))

(define (lower-bound a)
  (car a))

(define (upper-bound a)
  (cdr a))
