; This is exercise 1.32 from Abelson & Sussman, a generalization of the
; "generalized sum" program from exercise 1.30

(define (accumulate_iter combiner neutral term a next b)
  (define (iter x acc)
    (if (> x b)
      acc
      (iter (next x) (combiner acc (term x)))
      )
    )

  (iter a neutral)
  )

; The recursive process version is simpler, so we skip it here.

; And a few helper functions to test it
(define (id x) x)
(define (inc x) (+ x 1))
(define (add x y) (+ x y))

