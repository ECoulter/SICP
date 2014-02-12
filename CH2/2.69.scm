(load "HuffmanTrees.scm")
(load "2.67.scm")
(load "2.68.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (generate-huffman-tree2 pairs)
  (successive-merge2 (make-leaf-set pairs)))

;y my solution
;mine relies on adjoin-set working in the opposite way!
; however, it also fails to provide a shorter encoding than doing it
; the internet way, even whwn working properly
(define (successive-merge2 set-of-leaves)
  (if (null? (cddr set-of-leaves))
      (make-code-tree (car set-of-leaves)
                      (cadr set-of-leaves))
      (make-code-tree (car set-of-leaves) 
                      (successive-merge2 (cdr set-of-leaves)))))

;internet solution        
;mine forgot to sort the tree as I went using adjoin-set.
(define (successive-merge set-of-leaves)
  (if (null? (cdr set-of-leaves))
         (car set-of-leaves)
      (successive-merge
         (adjoin-set (make-code-tree (car set-of-leaves) 
                                     (cadr set-of-leaves))
                     (cddr set-of-leaves)))))
        
