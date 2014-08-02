; Nested iterations
;
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
    )
  )

(define (enumerate-interval a b)
  (if (<= a b)
    (cons a (enumerate-interval (+ a 1) b))
    (list)
    )
  )

(define (enumerate-ordered-pairs n)
  (accumulate 
    append 
    (list)
    (map (lambda (i)
           (map (lambda (j) (list i j))
                (enumerate-interval 1 i)))
         (enumerate-interval 1 n)
         )
    )
  )

