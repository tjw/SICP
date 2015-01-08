#lang racket

;; 'if' returns + or - as a function

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 4 5)
(a-plus-abs-b 4 -5)
