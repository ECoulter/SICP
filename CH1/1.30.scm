
(define (sum term a next b)
                        (if (> a b)
                            0
                            (+ (term a) (sum term (next a) next b))))

(define (sum-iter term a next b)
   (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (+ result (term a)) )))
   (iter a 0))

(define (inc x) (+ x 1))

(define (sum-ints a b)
   (sum identity a inc b))

(define (sum-ints2 a b)
   (sum-iter identity a inc b))

(define (integral2 f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum-iter f (+ a (/ dx 2.0)) add-dx b)
     dx))
