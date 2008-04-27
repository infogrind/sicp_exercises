; Implementation of the rational number arithmetic from Abelson & Sussman,
; Section 2.1

; Constructor and two selectors
(define (make-rat x y) (normalize (cons x y)))
(define (numer r) (car r))
(define (denom r) (cdr r))

; Arithmetical operations
(define (add-rat r s)
  (make-rat (+
              (* (numer r) (denom s))
              (* (denom r) (numer s)))
            (* (denom r) (denom s)))
  )

(define (sub-rat r s)
  (make-rat (-
              (* (numer r) (denom s))
              (* (denom r) (numer s)))
            (* (denom r) (denom s)))
  )

(define (mul-rat r s)
  (make-rat (* (numer r) (numer s)) (* (denom r) (denom s))))

(define (div-rat r s)
  (make-rat (* (numer r) (denom s)) (* (denom r) (numer s))))

; Normalize a rational number by dividing numerator and denominator until their
; GDC is 1.
; Note that this implementation is not very intelligent: After dividing
; numerator and denominator by their GCD for the first time, the fraction is
; already normalized and we don't have to apply normalization again. 
; It would be easier to just have make-rat divide the two arguments by their
; GCD. 
(define (normalize r)
  (let ((g (gcd (numer r) (denom r))))
    (if (= g 1) r
      (normalize (make-rat (/ (numer r) g) (/ (denom r) g))))))

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b)))))

; Display
(define (print-rat r)
  (newline)
  (display (numer r))
  (display "/")
  (display (denom r)))
