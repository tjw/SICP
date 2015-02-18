#lang racket


(define (filtered-accumulate filter? combiner null-value term a next b)
  (define (iter acc a)
    (cond ((> a b) acc)
          ((filter? a) (iter (combiner acc (term a)) (next a)))
          (else (iter acc (next a)))))
                
  (iter null-value a))

; not bothering to write the tests
