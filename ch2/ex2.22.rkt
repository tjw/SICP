#lang racket

(define (square n) (* n n))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items '()))

(square-list (list 1 2 3 4 5))

; Returns a nil-prefixed inverted list
; '(((((() . 1) . 4) . 9) . 16) . 25)
