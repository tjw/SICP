#lang racket

(define x 
  (list (list 1 2) (list 3 4 (list 5 6))))


x

(define (deep-reverse items)
  (if (not (pair? items)) items
      (reverse (map deep-reverse items))))

(deep-reverse x)
