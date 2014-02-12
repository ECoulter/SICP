;extend to infix notation, assuming that all '+' and '*' are
;completely parenthesized. 
; should be possible only be changing the 
; underlying functions in deriv
; change predicates, selectors, and constructors only!
; (only modify make-product, make-sum, etc. )
;we will not worry about exponentiation here?

;example : (deriv '(x + (3 * (x + (y + 2)))) 'x)

(define dertest '(x + (3 * (x + (y + 2)))))
(define dertestb '(x + 3 * (x + y + 2)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

;; representing algebraic expressions

;(define (variable? x) (symbol? x))

;(define (same-variable? v1 v2)
;  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;(define (make-sum a1 a2) (list '+ a1 a2))

;(define (make-product m1 m2) (list '* m1 m2))

;old way
;(define (sum? x)
;  (and (pair? x) (eq? (car x) '+)))
;infix way
;(define (sum? x)
;  (and (pair? x) (eq? (cadr x) '+)))

;old way
;(define (addend s) (cadr s))
;infix way
;(define (addend s) (car s))

;old way
;(define (augend s)  
;       (make-sum (caddr s) (cdddr s)))
;infix way
;easy, since fully parenthesized!
;(define (augend s) (caddr s)) 

;old way
;(define (product? x)
;  (and (pair? x) (eq? (car x) '*)))
;infix way
;(define (product? x)
;  (and (pair? x) (eq? (cadr x) '*)))

;old way
;(define (multiplier p) (cadr p))
;infix way
;(define (multiplier p) (car p))

;old way
;(define (multiplicand p) 
;        (make-product (caddr p) (cdddr p)))
;infix way
;(define (multiplicand p) (caddr p))

;(define (exponentiation? x)
;  (and (pair? x) (eq? (car x) '**)))

;(define (base p) (cadr p))

;(define (exponent p) (caddr p))

;; With simplification

;(define (make-sum a1 a2)
;  (cond ((=number? a1 0) a2)
;        ((=number? a2 0) a1)
;        ((eq? a2 '()) (if (pair? a1) 
;                         (car a1)
;                          a1))
;        ((and (number? a1) (number? a2)) (+ a1 a2))
;        (else (list '+ a1 a2))))

;(define (=number? exp num)
;  (and (number? exp) (= exp num)))

;(define (make-product m1 m2)
;  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
;         ((eq? m2 '()) (if (pair? m1) 
;                          (car m1)
;                           m1))
;        ((=number? m1 1) m2)
;        ((=number? m2 1) m1)
;        ((and (number? m1) (number? m2)) (* m1 m2))
;        (else (list '* m1 m2))))
;
;###############################
;PART B: Design this so that full parenthesization is not required!
; this is trickier - duh
; have to find out whether each element is
; an operator, and if so, if it is a "lowest precedence" op
; only design new slectors, predicates, and constructors

;; representing algebraic expressions

;need to check for singletons!

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;(define (make-sum a1 a2) (list '+ a1 a2))

;(define (make-product m1 m2) (list '* m1 m2))

(define (before-op op s)
  (if (eq? op (car s))
      '()
      (cons (car s) (before-op op (cdr s)))))

(define (after-op op s)
  (if (eq? op (car s))
      (cdr s)
      (after-op op (cdr s))))

(define (singleton-fix x) 
  (if (pair? x)
      (if (null? (cdr x))
          (singleton-fix (car x))
                              x)
       x))
;run through x, see if there is at least one '+'
(define (sum? x)
  (list? (memq '+ x)))

;return part of s before the first '+'
(define (addend s) (singleton-fix (before-op '+ s)))
;(define (addend s) (before-op '+ s))

;return part of s after the first '+'
(define (augend s) (singleton-fix (after-op '+ s)))

;run through x, see if there is at least one '*'
(define (product? x)
  (and (not (sum? x)) (list? (memq '* x))))

;return ITEM immediately before the '*'
(define (multiplier p) (singleton-fix (before-op '* p)))

;return ITEM immediately after the '*'
(define (multiplicand p) (singleton-fix (after-op '* p)))

;able to remove old singleton fix here, now that it's a real 
; function!
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

