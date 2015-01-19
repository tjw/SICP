#lang racket

; recursive since the inc is left on the stack while + is recursed into
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; iterative since the recursive + is tail called
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
