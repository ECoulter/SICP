(load "HuffmanTrees.scm")
(load "2.67.scm")

(define (encode message tree)
  (if (null? message) 
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;design encode-symbol so that it signals an error if the symbol
; is not in the tree at all!
; test by re-encoding the message from 2.67

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
   (if (memq symbol (symbols tree)) ;true if the symbol is in the tree
       (if (memq symbol (symbols (left-branch tree)))
           (cons 0 (encode-symbol symbol (left-branch tree)))
           (cons 1 (encode-symbol symbol (right-branch tree))))
       (error "Bad symbol in encode-symbol!" symbol))))
