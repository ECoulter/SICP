;consider order of (n) needed to encode a symbol using 268
; with a huffman tree of the type in 2.71 where
; all symbols have weights 1,2,4,...2^(n-1)

;searching the symbol list fors liks n, then checking the next branch list
; goes like n-1
; at worst, you get (n) + (n-1) + (n-2) + ... 1  order...
; at the best, you get O(n)
