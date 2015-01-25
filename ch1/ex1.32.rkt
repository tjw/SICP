#lang racket

(define (inc n) (+ 1 n))
(define (mul a b) (* a b))

(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recur combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (combiner acc (term a)) (next a))))
  (iter null-value a))

        
(define (factorial n)
  (accumulate-iter mul 1 identity 1 inc n))

(factorial 5)