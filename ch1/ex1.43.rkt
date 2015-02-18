#lang racket

(require "helpers.rkt")

(define (repeated f n)
  (cond ((= 0 n) identity)
    ((= 1 n) f)
    (else (compose f (repeated f (- n 1))))))

((repeated square 2) 5)
