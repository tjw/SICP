#lang racket

(define (enumerate-interval i j)
  (if (> i j) null
      (cons i (enumerate-interval (+ 1 i) j))))
  
;(enumerate-interval 5 8)

(define (unique-pairs n)
  (enumerate-interval 1 n))
  