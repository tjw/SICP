#lang racket

(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (mult a b)
  (cond ((= 0 b) 0)
        ((= 1 b) a)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))

(mult 3 7)