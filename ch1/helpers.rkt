#lang racket

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2))
                                   tolerance)) (define (try guess)
                                                 (let ((next (f guess)))
                                                   (if (close-enough? guess next)
                                                       next
                                                       (try next))))
  (try first-guess))

(define dx 0.00001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess) (fixed-point (newton-transform g) guess))

(define (square x)
  (* x x))
(define (inc x)
  (+ 1 x))
(define (dec x)
  (- x 1))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(provide newtons-method)
(provide deriv)
(provide fixed-point)
(provide square)
(provide inc dec)
(provide compose)
