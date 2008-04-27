; Sequences (lists) -- Section 2.2.1 from Abelson & Sussman.
; Various procedures to be used with lists

; A few lists, for testing purposes
(define a (list 3 6 9 12 15))
(define b (list 2 4 6 8 10 12))
(define t (list 1 2 (list 3 (list 4 5)) 6 (list 7 8 (list 9 10))))

; Acessing the n-th element of a list
(define (list-ref l n)
  (if (= n 0) (car l)
    (list-ref (cdr l) (- n 1))))

; Appending one list to another
(define (list-append l m)
  (if (null? l) m
    (cons (car l) (append (cdr l) m))))

; Last element of a list
(define (last l)
  (if (null? (cdr l)) (car l)
    (last (cdr l))))

; Length of a list (iterative process)
(define (length l)
  (define (length-iter l n)
    (if (null? l) n
      (length-iter (cdr l) (+ n 1))))

  (length-iter l 0))

; Apply a function to each element of a list (iterative process)
(define (myapply f l)
  (define (apply-iter l a)
    (if (null? l) a
      (apply-iter (cdr l) (append a (list (f (car l)))))))

  (apply-iter l ())
  )

; Returns the last pair (the one containing nil as its second element)
; (Exercise 2.17 from Abelson & Sussman)
(define (last-pair l)
  (if (null? (cdr l)) l
    (last-pair (cdr l))))

; Returns a list in reverse order
; (Exercise 2.18 from Abelson & Sussman)
(define (myreverse l)
  (if (null? l) l
    (list-append (myreverse (cdr l)) (list (car l)))))

; Deep-reverses a nested list (reverses the list and all sublists)
; (Exercise 2.27 from Abelson & Sussman)
(define (deepreverse l)
  (cond ((null? l) l)
        ((not (pair? l)) l)
        (else (list-append (deepreverse (cdr l)) (list (deepreverse (car l)))))))

; Execute statements for each elements of a list 
; (Exercise 2.23 from Abelson & Sussman)
(define (myfor-each f l)
  (cond ((not (null? l)) (f (car l)) (myfor-each f (cdr l)))))

; Return the list of leaves of a list-ed tree structure, from left to right
; (Exercise 2.28 from Abelson & Sussman)
(define (fringe t)
  (cond ((null? t) t)
        ((not (pair? t)) (list t))
        (else (list-append (fringe (car t)) (fringe (cdr t))))))

; square each element of a tree
; (Exercise 2.30 from Abelson & Sussman)
(define (square-tree t)
  (define (square x) (* x x))
  (cond ((null? t) t)
        ((not (pair? t)) (square t))
        (else (cons (square-tree (car t)) (square-tree (cdr t))))))

; Apply a function to every element of a tree
; (Exercise 2.31 from Abelson & Sussman)
(define (map-tree f t)
  (cond ((null? t) t)
        ((not (pair? t)) (f t))
        (else (cons (map-tree f (car t)) (map-tree f (cdr t))))))

; Using this, we can implement square-tree alternatively like this:
(define (square-tree2 t)
  (map-tree (lambda (x) (* x x)) t))

; Interpret a list as a set, and give a list containing all subsets of the set
; (power set)
; The idea behind the implementation is this: Let s be a set, and let a be its
; first element. Then the power set of s is the union of the power set of s\{a}
; and that same power set, with a added to each of its elements. Below we use
; 'map' to add the element a (here (car l)) to each subset.
; (Exercise 2.32 from Abelson & Sussman)
(define (subsets l)
  (if (null? l) (list ())
    (let ((rest (subsets (cdr l))))
      (list-append rest (map (lambda (x) (cons (car l) x)) rest))
      )
    )
  )
