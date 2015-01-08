#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x) (better-good-enough? guess x))

(define (original-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (better-good-enough? guess x)
  (< (abs (- 1 (/ (square guess) x))) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Not using 'let' since we don't know that yet...
(define (percent-error x)
  (percent-error2 x (square (sqrt x))))

(define (percent-error2 original estimate)
  (abs (/ (- original estimate) original)))
  
  
(percent-error 4)
(percent-error 0.1)
(percent-error 0.001) ;; 0.7011851721075595 with the original good-enough?
