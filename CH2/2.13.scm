;Assuming Small % tolerance, show that (if %tol is small)
;there is a simple formula for the approx. %tol of the product
;of two intervals in terms of the tolerances of the two intervals. 

;so: (c-pc,c+pc) x (d-qd,d+qd)
;   =(cd - pcd - qcd + pqcd,cd + pcd + qcd + pqcd)
;  ~=(cd - (p + q)cd,cd + (p + q)cd)
;   =(cd - rcd,cd + rcd)
; so that r ~= (p + q), if (pqcd) is small!  (pq << 1)
;note: this actually gives the new width exactly, but the center has been 
;shifted so that it is now cd+pqcd. 
