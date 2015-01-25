#lang racket

(define (product term a next b)
  (define (iter a result)
    (if (> a b) ; make sure we get the first term for a..b to be an inclusive range
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc n) (+ 1 n))
(define (inc2 n) (+ 2 n))

(define (factorial a) (product identity 1 inc a))
;(factorial 5)

; Simplify the formula by factoring a two out of the numerator and steping each time by two while squaring in the term
(define (square n) (* n n))

(define (pi-est n)
  ; Take care to make sure each gets the name number of terms, approximately 2n
  (define numerator (* 2 (product square 4 inc2 (+ n 4))))
  (define denominator (* (+ n 3) (product square 3 inc2 (+ n 3))))
  
  ; The intial factor of two from the numerator and the 4 to get pi instead of pi/4
  (*  4.0 (/ numerator denominator)))

(pi-est 1000)