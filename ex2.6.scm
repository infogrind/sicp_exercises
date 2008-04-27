; Exercise 2.6 from Abelson & Sussman.
; Extremely esoteric representation of numbers and addition (Church numerals).

; Zero returns a function which returns the identity function when applied to
; anything.
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
