#lang racket

; calculate the innermost nk/dk term first. keep a running tally in 'prev'
(define (cont-frac-iter n d k)
  (define (step i acc)
    (if (= i 0) acc
        (step (- i 1) (/ (n i) (+ (d i) acc)))))
  (step k 0))

(define (tan-cf x k) (cont-frac-iter (lambda (i) (if (= i 1) x (- (* x x))))
                                     (lambda (i) (- (* 2 i) 1))
                                     k))

; not right... tried tweaking cont-frac-iter from previous exercises and got differnt wrong answer
(tan-cf 0.4 100)
(tan 0.4)