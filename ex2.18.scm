; Reverses a list.
; Example:
; (reverse (list 1 4 9 16 25))
;   (25 16 9 4 1)

(define (reverse l)
  (define (reverse-iter l acc)
    (if (null? l)
      acc
      (reverse-iter (cdr l) (cons (car l) acc))
      )
    )
  (reverse-iter l (list))
  )
