; Exercise 1.16 from Abelson & Sussman
; Iterative version of the fast-exp procedure from Section 1.2.4 (see
; fastexp.scm). 
(define (fast-exp b n)

  (define (square x) (* x x))
  (define (even? x) (= (remainder x 2) 0))

  (define (fast-exp-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-exp-iter a (square b) (/ n 2)))
          (else (fast-exp-iter (* a b) b (- n 1)))))
  
  (fast-exp-iter 1 b n)

  )
