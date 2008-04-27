; Computes Pascal's triangle

; Parameters: n = row #, k = entry in row. Need 1 <= k <= n
(define (pascal n k)
  (if (or (= k 1) (= n k)) 
    1
    (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k))
    )
  )

