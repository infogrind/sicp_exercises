; Euclid's GCD algorithm
; GCD(a, b) = GCD(b, r) where = a mod b
; based on Section 1.2.5 in Abelson & Sussman
(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b)))))
