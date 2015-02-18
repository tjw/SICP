#lang racket

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment a b) (cons a b))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment a)
  (make-segment (average (x-point (start-segment s))
                         (x-point (end-segment s)))
                (average (y-point (start-segment s))
                         (y-point (end-segment s)))))


(define s (make-segment (make-point 1 3) (make-point 5 9 )))
(midpoint-segment s)
