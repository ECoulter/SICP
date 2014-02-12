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
        (p3 (* (upper-bound x) (upper-bound y))))
   (make-intercal (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
               (make-interval (/ 1.0 (upper-bound y))
                              (/ 1.0 (lower-bound y)))))

(define (make-interval a b)
  (cons a b))

(define (lower-bound a)
  (car a))

(define (upper-bound a)
  (cdr a))
