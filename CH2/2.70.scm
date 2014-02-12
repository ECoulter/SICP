(load "2.69.scm")

(define fifties-tree2 (generate-huffman-tree2 '((A 2)
                                              (BOOM 1)
                                              (GET 2) 
                                              (JOB 2)
                                              (SHA 3)
                                              (NA 16)
                                              (WAH 1)
                                              (YIP 9))))

(define fifties-tree (generate-huffman-tree '((A 2)
                                              (BOOM 1)
                                              (GET 2) 
                                              (JOB 2)
                                              (SHA 3)
                                              (NA 16)
                                              (WAH 1)
                                              (YIP 9))))

(define song '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(define coded-song (encode song fifties-tree))

(define coded-song2 (encode song fifties-tree2))

;(length coded-song) ;this is 84 bits!
;(length coded-song2) ;this is 220 bits!
                     ; see note in 2.69.scm

;had we used a fixed-length code, we'd have 3 bits per entry in song
; so that there would be: 36*3 = 108 bits
