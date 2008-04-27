; Exercise 2.4 from Abelson & Sussman.
; Alternative implementation of pairs (procedures cons, car, cdr).
; The semantic requirement is that if z is (cons x y) then (car z) is x and
; (cdr z) is y.

; cons returns a procedure that, if applied to another procedure m, is equal to
; m applied to x and y (the elements of the pair)
(define (mycons x y)
  (lambda (m) (m x y)))

(define (mycar z)
  (z (lambda (p q) p)))

(define (mycdr z)
  (z (lambda (p q) q)))
