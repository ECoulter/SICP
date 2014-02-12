(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
          (let ((left-result
                (partial-tree elts left-size)))
            (let ((left-tree (car left-result))
                  (non-left-elts (cdr left-result))
                  (right-size (- n (+ left-size 1))))
              (let ((this-entry (car non-left-elts))
                    (right-result
                     (partial-tree
                      (cdr non-left-elts)
                       right-size)))
                (let ((right-tree (car right-result))
                      (remaining-elts
                       (cdr right-result)))
                  (cons (make-tree this-entry
                                   left-tree
                                   right-tree)
                        remaining-elts))))))))

;a.) write a paragraph explaining partial-tree:
;So: Partial-tree takes in a list (nodes) and a max size of the tree to
;    be made. If size = 0, a null leaf is created. Otherwise, the given
;    set of elements is split into two branchs, recursively made by partial-
;    tree. The left is chosen to have (floor (n-1)/2) elements, while the right 
;    branch takes either (n-1)/2 or (n/2) elements, depending if n is even
;    or odd. After the left-side is constructed, the right-side is made
;    from the elements in the list NOT included in the left side. (These
;    elements are returned as well by partial-tree). The "current"
;    entry is the first element in this list. (Originally, the n/2 element).

;The tree produced by the list (1 3 5 7 9 11) will be:
;                             5
;                           /   \
;                          1     9
;                           \   / \
;                            3 7  11

;b.) What is the order of growth in # steps for list-tree to convert
;    a list of n elements?
;    Goes by O(n) - since each step in the series is constant-time
;     and we have T(n) = 2*T(n/2) + O(1) (the O(1) for make-tree)
