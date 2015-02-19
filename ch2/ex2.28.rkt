#lang racket

(define x 
  (list (list 1 2) (list 3 4)))

(define (fringe items)
  (cond ((null? items) items)
        ((not (pair? items)) (list items))
        (else (append (fringe (car items)) (fringe (cdr items))))))

(fringe (list 1))

(fringe x)
; (1 2 3 4)

(fringe (list x x))
; (1 2 3 4 1 2 3 4)

