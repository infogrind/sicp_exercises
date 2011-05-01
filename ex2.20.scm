; A procedure that returns a list of all function arguments that have the same
; parity as the first one

(define (filter-elements l pred)
  (if (null? l)
    l
    (let ((x (car l)))
      (if (pred x)
        (cons x (filter-elements (cdr l) pred))
        (filter-elements (cdr l) pred))
      )
    )
  )

(define (even-elements l)
  (filter-elements l even?)
  )
(define (odd-elements l)
  (filter-elements l odd?)
  )

(define (same-parity x . y)
  (if (even? x)
    (cons x (even-elements y))
    (cons x (odd-elements y))
    )
  )
