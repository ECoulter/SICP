;huffman tree with alphabet of n symbols, with weights
; 1, 2, 3, ... 2^(n-1)

;sketch for n = 5, and n = 10
;for n = 5, (1,2,4,8,16)

;tree like (16 (8 (4  (2 1)))) 

; and for 10: (2^9 (2^8 (2^7 (2^6 (2^5 (16 (8 (4 (2 1)))))))))


;in such a tree, how many bits are required to encode the most frequent 
; sybmol?
;bits for most frequent s 1
;the least frequent?
;bits for least frequent is n-1
