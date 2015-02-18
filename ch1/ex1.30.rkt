#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b) ; make sure we get the first term for a..b to be an inclusive range
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc a) (+ a 1))
(define (cube x) (* x x x))

(sum cube 1 inc 10)


  