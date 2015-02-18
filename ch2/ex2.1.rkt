#lang racket

(define (add-rat x y)
(make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
(make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
(make-rat (* (numer x) (numer y))
(* (denom x) (denom y)))) (define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
(= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; Don't need a special case for both negative
(define (make-rat n d)
  (if (< d 0)
      (make-rat (- n) (- d))
      (let ((g (gcd n d)))
        (cons (/ n g) (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(make-rat 6 8)
(make-rat -6 8)
(make-rat 6 -8)
(make-rat -6 -8)
