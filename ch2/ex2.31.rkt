#lang racket

(define (tree-map f t)
  (cond ((null? t) t)
        ((pair? t) (cons (tree-map f (car t)) (tree-map f (cdr t))))
        (else (f t))))

(define (square n) (* n n))

(tree-map square (list 1 (list 2 3)))