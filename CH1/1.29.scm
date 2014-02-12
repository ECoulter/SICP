
(define (sum term a next b)
                        (if (> a b)
                            0
                            (+ (term a) (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))

(define (simp-int f a b n)
  (define h (/ (- b a) n))  
  (define (next x) (+ x (* 2.0 h)))
  (* (/ h 3.0)
     (+ (f a)
        (* 4.0 (sum f (+ h a) next (- b h)))
        (* 2.0 (sum f (next a) next  (- b h)))
        (f b))))

(define (simp-int2 f a b n) 
   (define h (/ (- b a) n))  
   (define (add-2h x) (+ x (* 2 h))) 
   (* (/ h 3.0) 
                (+ (f a)  
                   (* 4.0 (sum f (+ a h) add-2h (- b h)))  
                   (* 2.0 (sum f (add-2h a) add-2h (- b h)))  
                   (f (+ a (* h n))))))
