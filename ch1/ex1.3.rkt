#lang racket

;; lame, but in keeping with what we know so far...
(define (sum-of-squares-of-largest-two a b c)
  (cond ((and (<= a b) (<= a c)) (+ (* b b) (* c c)))
        ((and (<= b a) (<= b c)) (+ (* a a) (* c c)))
        ((and (<= c a) (<= c b)) (+ (* a a) (* b b)))))

(sum-of-squares-of-largest-two 2 3 4)
(sum-of-squares-of-largest-two 4 2 3)
(sum-of-squares-of-largest-two 3 4 2)

(sum-of-squares-of-largest-two 1 1 1)

        