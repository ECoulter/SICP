;Exercise 2.55.  Eva Lu Ator types to the interpreter the expression

;(car ''abracadabra)

;To her surprise, the interpreter prints back quote. Explain.

;because the single quote is interpreted as the function (quote x), so when
;taken literally, with (quote (quote x)), (quote x) is returned. 
