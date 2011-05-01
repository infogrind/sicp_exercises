; This procedure returns the leaves of a tree, from left to right

; The fringe of a tree is the concatenation of the fringe of all its subtrees.
; If an element is not a subtree, it is added itself to the fringe.c

(define (fringe tree)
  (cond
    ((null? tree) (list))
    ((not (pair? tree)) (list tree))
    (else (append (fringe (car tree)) (fringe (cdr tree))))
    )
  )


; Examples
(define x (list (list 1 2) (list 3 4)))

(display (fringe x))
(newline)
; (1 2 3 4)

(display (fringe (list x x)))
(newline)
; (1 2 3 4 1 2 3 4)
