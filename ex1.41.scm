; Exercise 1.41 from Abelson & Sussman.
; The procedure double takes a procedure of one argument as argument and returns
; a procedure that applies the original procedure twice.
(define (double f)
  (lambda (x) (f (f x))))

; inc function to test
(define (inc x) (+ x 1))
