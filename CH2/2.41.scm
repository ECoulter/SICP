(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (square x) (* x x))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (make-triplet-sum trip)
  (list (car trip) (cadr trip) (caddr trip) (+ (car trip) (cadr trip) 
                                               (caddr trip))))

(define (unique-triplets n)
;  (accumulate append nil
  (flatmap (lambda (i)
             (flatmap (lambda (j) 
                    (map (lambda (k) (list i j k))
                         (enumerate-interval 1 j)))
                    (enumerate-interval 1 i)))
             (enumerate-interval 1 n)))

(define (sum-triplets n sum)
  (define (trip-sum? trip)
    (= (accumulate + 0 trip) sum))
  (map make-triplet-sum
       (filter trip-sum?
               (unique-triplets n))))
