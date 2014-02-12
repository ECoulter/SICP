(define (make-vec x y) 
  (list x y)
)

(define (xcor-vec v)
  (car v) )

(define (ycor-vec v)
  (car (cdr v)))

(define (add-vec v u)
  (make-vec (+ (xcor-vec v) (xcor-vec u))
            (+ (ycor-vec v) (ycor-vec u))))

(define (sub-vec v u)
  (make-vec (- (xcor-vec v) (xcor-vec u))
            (- (ycor-vec v) (ycor-vec u))))

(define (scale-vec a v)
  (make-vec (* a (xcor-vec v))
            (* a (ycor-vec v))))
