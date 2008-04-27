; Exercise 1.11 from Abelson/Sussman

; Procedure that implements a recursive process:
(define (f n)
  (if (< n 3) n
    (+ (f (- n 1))
       (* (f (- n 2)) 2)
       (* (f (- n 3)) 3))))

; Procedure that implements an iterative process:
(define (g n)
  (define (g-iter a b c counter)
    (if (= n counter) c
      (g-iter (+ a (* b 2) (* c 3)) a b (+ counter 1)))
    )

  (g-iter 2 1 0 0)
  )

; Here is a similar procedure, but this one returns all elements up to n of the
; sequence as a list.
(define (g-list n)
  (define (g-iter a b c counter)
    (if (= n counter) (cons c ())
      (cons c (g-iter (+ a (* b 2) (* c 3)) a b (+ counter 1))))
    )

  (g-iter 2 1 0 0)
  )

