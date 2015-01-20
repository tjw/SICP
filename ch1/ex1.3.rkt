#lang racket

;; lame, but in keeping with what we know so far...
(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (sum-of-squares-of-largest-two a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        ((and (<= c a) (<= c b)) (sum-of-squares a b))))

(sum-of-squares-of-largest-two 2 3 4)
(sum-of-squares-of-largest-two 4 2 3)
(sum-of-squares-of-largest-two 3 4 2)

(sum-of-squares-of-largest-two 1 1 1)

        