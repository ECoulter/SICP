;Define PRODUCT in the same way as SUM
; use PRODUCT to define factorial, and also (PI/4) = (2 * 4 * 4 * 6 * 6 * 8 * 8...)/(3 * 3 * 5 * 5 * 7 * 7...)
;define this iteratively instead of recursively


(define (prod term a next b)
                        (if (> a b)
                            1
                            (* (term a) (prod term (next a) next b))))

(define (prod-iter term a next b)
   (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (* result (term a)) )))
   (iter a 1))

(define (inc x) (+ x 1))

(define (prod-ints a b)
   (prod identity a inc b))

(define (factorial b)
   (prod identity 1 inc b))

(define (prod-ints2 a b)
   (prod-iter identity a inc b))

(define (factorial2 b)
   (prod-iter identity 1 inc b))

(define (square x) (* x x))

(define (pi-prod n)
  (define (next x) (+ 2 x))
   (* (/ 2.0 n) (/ (prod square 2 next n) (prod square 3 next n))))

; this one seems better, maybe? Less division...
(define (pi-prod3 n)
  (define (pi-term x) 
    (if (even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (define (next x) (+ 1 x))
   (* 4.0 (prod pi-term 1 next n) ))

(define (pi-prod-iter n)
  (define (next x) (+ 2 x))
   (* (/ 2.0 n) (/ (prod-iter square 2 next n) (prod-iter square 3 next n))))
