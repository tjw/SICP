#lang racket

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (cube guess) x))) 0.001))

(define (cube x) (* x x x))

(define (cbrt x)
  (cbrt-iter 1.0 x))

;; Not using 'let' since we don't know that yet...
(define (percent-error x)
  (percent-error2 x (cube (cbrt x))))

(define (percent-error2 original estimate)
  (abs (/ (- original estimate) original)))
  
  
(percent-error 4)
(percent-error 0.1)
(percent-error 0.001)
