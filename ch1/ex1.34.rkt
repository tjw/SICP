#lang racket

(define (square x) (* x x))

(define (f g) (g 2))
(f square)


(f (lambda (z) (* z (+ z 1))))

; fails since f expects a procedure and when it is passed as g it is then applied to 2
(f f)