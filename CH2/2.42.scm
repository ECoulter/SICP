(define nil '())

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

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define test-queens (list (list 1 2) (list 2 1)))

(define (queens board-size)
  (define(queen-cols k)
     (if (= k 0)
         (list empty-board)
         (filter 
           (lambda (positions) (safe? k positions))
           (flatmap 
;rest-of-queens - way to place k-1 queens in the first k-1 
;columns
             (lambda (rest-of-queens)
;new-row - proposed row to place the queen of the kth column
;          in
                (map (lambda (new-row)
                        (adjoin-position new-row k rest-of-queens))
                     (enumerate-interval 1 board-size)))
             (queen-cols (- k 1))))))
  (queen-cols board-size))
                     
;adjoin-position - adjoins a new row-column position to a
;                  set of positions
;set of positions is a list of pairs! (row, col)
(define (adjoin-position new-row k rest-of-queens)
;  (accumulate (lambda (x) (append x (list new-row k))) 
  (append     rest-of-queens
              (list (cons new-row (cons k empty-board))))
)

;empty-board - represents an empty set of positions
; just nil?
(define empty-board nil)


;safe? - determines if position k is safe from the other
;        k-1 queens
; check if safe - Horiz and Diag!
(define (safe? k inposns)
  (define newpos (car (reverse inposns)))
  (define (safe-iter posns)
  (cond ((null? posns) #t)
        ((= (row newpos) (row (car posns)))
            #f)
        ((diag? newpos (car posns))
            #f)
        (else (safe-iter (cdr posns)))))
  (if (null? (cdr inposns))
      #t
      (safe-iter (cdr (reverse inposns)))))

(define (row posn)
  (car posn))

(define (col posn)
  (car (cdr posn)))

;returns true if two posn's are on a diagonal (chessboard) to 
; each other!
(define (diag? newpos oldpos)
  (if (= 1 (abs (/ 
                   (- (row newpos) (row oldpos))
                   (- (col newpos) (col oldpos)))))
      #t
      #f))


;This would give a MAP that does what the filter is supposed
; to do... whoops.
;  (cond ((null? posns) inposns)
;        ((= (row newpos) (row (car posns)))
;            empty-board)
;        ((diag? newpos posns)
;            empty-board)
;        (else (safe-iter (cdr posns)))))
;  (if (null? (cdr inposns))
;      inposns
;      (safe-iter (cdr (reverse inposns)))))
       
