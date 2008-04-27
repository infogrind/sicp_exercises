; Exercise 2.5 from Abelson & Sussman
; Implementation of the pair (a,b) as a single integer 2^a * 3^b

(define (mycons a b)
  (* (pow 2 a) (pow 3 b)))

(define (mycar c)
  (if (divisible-by-three? c) (mycar (/ c 3))
    (log2 c)))

(define (mycdr c)
  (if (even? c) (mycdr (/ c 2))
    (log3 c)))

; Recursive process; could be done nicer as an iterative process.
(define (pow n p)
  (if (= p 0) 1
  (* n (pow n (- p 1)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (divisible-by-three? x)
  (= (remainder x 3) 0))

; Simple logarithms that work only for integer powers of the respective bases
(define (mylog x n)
  (cond ((= x 1) 0)
        (else (+ 1 (mylog (/ x n) n)))))

(define (log2 x) (mylog x 2))
(define (log3 x) (mylog x 3))

