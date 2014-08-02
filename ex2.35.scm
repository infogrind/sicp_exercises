(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
    )
  )

(define (count-leaves seq)
  (define (op x y)
    (cond
      ((null? x) y)
      ((not (pair? x)) (+ y 1))
      (else (+ y (count-leaves x)))
      )
    )
  (accumulate op 0 seq)
  )

(define (count-leaves-alt seq)
  (accumulate + 0 (map 
                    (lambda (x)
                      (cond
                        ((null? x) 0)
                        ((not (pair? x)) 1)
                        (else (count-leaves-alt x))
                        )
                      )
                    seq
                    )
              )
  )

(define x (list (list 1 2) (list 3 4)))

(display (count-leaves x))
(newline)
(display (count-leaves-alt x))
(newline)
