; This is the implementation of the "generalized sum" of Abelson&Sussman, p. 58
;
; Informal definition:
; sum_a^b f(x)
; and using the recursion
; sum_a^b f(x) = f(a) + sum_{a+1}^b f(x)
; The function term gives the next a, so that we can increase a by other things
; than 1

(define (sum term a next b)
  (if (> a b) 0
    (+ (term a)
       (sum term (next a) next b))))
