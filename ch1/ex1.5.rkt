#lang racket

;; normal-order full expands to primitives and then evaluates
;; applicative-order evaluates arguments and then applies
;; both seem like they'd hang; normal-order would expand (p) forever before evaluating anything and applicative would hang evaluating p.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

