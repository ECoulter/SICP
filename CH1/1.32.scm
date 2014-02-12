;Define accumulator in the same way as SUM and PRODUCT
;define this iteratively instead of recursively

(define (accumulate combiner null-val term a next b)
   (if (> a b)
       null-val 
       (combiner (term a) (accumulate combiner null-val term (next a) next b))))

(define (accumul-iter combiner null-val term a next b)
   (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (combiner result (term a)) )))
   (iter a null-val))

(define (plus a b) (+ a b))
(define (sum term a next b)
        (accumulate plus 0 term a next b))
(define (sum-iter term a next b)
        (accumul-iter plus 0 term a next b))

(define (times a b) (* a b))
(define (prod term a next b)
        (accumulate times 1 term a next b))
(define (prod-iter term a next b)
        (accumul-iter times 1 term a next b))

(define (inc x) (+ x 1))

(define (prod-ints a b)
   (prod identity a inc b))

(define (factorial b)
   (prod identity 1 inc b))

(define (prod-ints2 a b)
   (prod-iter identity a inc b))

(define (factorial2 b)
   (prod-iter identity 1 inc b))

(define (sum-ints a b)
   (sum identity a inc b))

(define (sum-ints2 a b)
   (sum-iter identity a inc b))
