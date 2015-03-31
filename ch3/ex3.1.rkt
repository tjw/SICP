#lang racket

(define (make-accumulator initial-value)
  (define current-value initial-value)
  (lambda (add-value) (begin (set! current-value (+ current-value add-value))
                             current-value)))

(define A (make-accumulator 5))
(A 10)
(A 10)
