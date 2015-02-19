#lang racket

(define x 
  (list (list 1 2) (list 3 4)))


x

(reverse x)

(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else (reverse (map reverse items)))))

(deep-reverse x)

