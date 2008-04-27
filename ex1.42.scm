; Exercise 1.42 from Abelson & Sussman
; The procedure (compose f g) implements the function composition f(g(x))
(define (compose f g)
  (lambda (x) (f (g x))))

; Some helper functions to test compose
(define (inc x) (+ x 1))
(define (square x) (* x x))
