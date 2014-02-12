; define lookup procedure for a database
; oganized as an odere binary tree ,by numerical value of the key


(define (lookup given-key set) 
  (cond ((null? set) false)
        ((equal? given-key (key (this-node set)))
          (this-node set))
        (else (if (< given-key (key (this-node set)))
                   (lookup given-ket (left-branch set))
                   (lookup given-key (rght-branch set))))))
