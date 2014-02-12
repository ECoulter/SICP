;Define accumulator in the same way as SUM and PRODUCT
;define this iteratively instead of recursively

(define (accumul-filter filt? combiner null-val term a next b)
   (if (> a b)
     null-val 
     (if (filt? a)
       (combiner (term a) (accumul-filter filt? combiner null-val term (next a) next b))
       (combiner null-val (accumul-filter filt? combiner null-val term (next a) next b)))))

(define (accumu-filt-iter filt? combiner null-val term a next b)
   (define (iter a result)
      (if (> a b)
          result
          (if (filt? a) 
              (iter (next a) (combiner result (term a))) 
              (iter (next a) result))))
   (iter a null-val))



(define (prime? n)
  (if (= 1 n)
      #f
      (= n (smallest-divisor n))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (next n)
   (if (= n 2) 
          3
          (+ 2 n)))

;sum of square of prime numbers in interval a,b

(define (inc x) (+ x 1))

(define (prime-square-sum a b)
  (accumu-filt-iter prime? + 0 square a inc b))

(define (dec x) (- x 1))

(define (rel-prime-int-prod n)
  (define (relprime? m) 
     (= 1 (gcd m n)))
  (accumu-filt-iter relprime? * 1 identity 1 inc (dec n)))


