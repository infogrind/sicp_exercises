; Returns only the last (nonempty) pair of a list.
; Example:
; (last-element (list 12 95 34 23))
;   (23)

(define (last-element l)
  (if (null? (cdr l))
    l
    (last-element (cdr l))
    )
  )

