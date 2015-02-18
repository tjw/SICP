#lang racket

(define (reverse l)
  (define (move-a-to-b a b)
    (if (null? a) b
        (move-a-to-b (cdr a) (cons (car a) b))))
  (move-a-to-b l '()))

(reverse (list 1 4 9 16 25))
