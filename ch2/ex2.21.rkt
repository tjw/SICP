#lang racket

(define (square n) (* n n))

(define (square-list1 items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list1 (cdr items)))))

(define (square-list2 items)
  (map square items))

(square-list1 (list 1 2 3 4 5))
(square-list2 (list 1 2 3 4 5))
