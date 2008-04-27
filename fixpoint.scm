; This file implements the fixpoint searching algorithms for functions, i.e.,
; find x such that f(x) = x. From Abelson & Sussman, p. 69

(define (fixpoint f first-guess)
  (define tolerance 0.00001)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
        next
        (try next))))

  (try first-guess)
  )
