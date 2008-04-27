; This is exercise 1.30 from Abelson & Sussman. 
; It implements the generalized sum function in gensum.scm using an iterative
; process.
;
; We can capture the state of the iteration in a single accumulator variable:
; the sum "up to now". 

(define (sum_iter term a next b)
  (define (iter x acc)
    (if (> x b)
      acc
      (iter (next x) (+ acc (term x)))
      )
    )

  (iter a 0)
  )

; For reference, here is the recursive version:
(define (sum term a next b)
  (if (> a b) 0
    (+ (term a)
       (sum term (next a) next b))))


; And we define a few helper functions
(define (id x) x)
(define (inc x) (+ 1 x))

