; (fast-exb b n) computes b^n, using a fast algorithm of order log(n)
(define (fast-exp b n)
  (define (square x) (* x x))
  (define (even? x) (= (remainder x 2) 0))

  (cond ((= n 0) 1)
        ((even? n) (fast-exp (square b) (/ n 2)))
        (else (* b (fast-exp b (- n 1))))
        )
  )

; For comparison, here is an implementation of a recursive process
; Use both fast-exp and slow-exp to compute 2^1024. The latter will probably
; result in a stack overflow.
(define (slow-exp b n)
  (if (= n 0) 1
  (* b (slow-exp b (- n 1)))))
