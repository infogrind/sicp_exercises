; map, append, and length as instances of accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
    )
  )

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y) ) (list) sequence)
  )

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)
  )

(define (length seq)
  (accumulate (lambda (x y) (+ y 1)) 0 seq)
  )

(display (map (lambda (x) (* x 2)) (list 1 2 3 4 5)))
(newline)

(display (append (list 1 2 3 4) (list 5 6 7 8)))
(newline)

(display (length (list 1 2 3 44 55 6 7 1 3)))
(newline)
