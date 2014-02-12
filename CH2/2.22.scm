;Exercise 2.22.  Louis Reasoner tries to rewrite the first square-list procedure of exercise 2.21 so that it evolves an iterative process:

;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things) 
;              (cons (square (car things))
;                    answer))))
;  (iter items nil))
;
;Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?

 Because the answer is constructed with the first item at the "beginning" of
 the cons sequence ,  which puts it at the "end" of the list. 
;
;Louis then tries to fix his bug by interchanging the arguments to cons:
;
;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things)
;              (cons answer
;                    (square (car things))))))
;  (iter items nil))
;
;This doesn't work either. Explain.

 This will create a pair of pairs since the sequence is no longer nil-terminated.
