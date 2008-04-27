; This is Exercise 1.19 from Abelson & Sussman.
; It is the O(log n) algorithm to compute Fibonacci numbers.
(define (fib-fast n)
  (define (even? x) (= (remainder x 2) 0))
  (define (square x) (* x x))
  (define (fib-fast-iter a b p q counter)
    (cond ((= counter 0) b )
          ((even? counter)
           (fib-fast-iter a b (+ (square p) (square q)) (+ (square q) (* 2 p q))
                          (/ counter 2)))
          (else
            (fib-fast-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q
                           (- counter 1)))))

  (fib-fast-iter 1 0 0 1 n)
  )
