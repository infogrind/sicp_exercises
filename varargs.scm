; Demonstration of variable argument lists in Scheme

(define (list-sum l)
  (define (list-sum-acc l a)
    (if (null? l)
      a
      (list-sum-acc (cdr l) (+ a (car l)) )
      )
    )
  (list-sum-acc l 0)
  )

(define (mysum . x)
  (list-sum x)
  )

(mysum 1 2 3 4 5 6 7 8 9 10)
