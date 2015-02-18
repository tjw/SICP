#lang racket

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-rect p1 p2) (cons p1 p2))
(define (p1-rect r) (car r))
(define (p2-rect r) (cdr r))

(define (width-rect r)
  (abs (- (x-point (p1-rect r)) (x-point (p2-rect r)))))
(define (height-rect r)
  (abs (- (y-point (p1-rect r)) (y-point (p2-rect r)))))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))
(define (perimieter-rect r)
  (* 2 (+ (width-rect r) (height-rect r))))

(define r (make-rect (make-point 1 1) (make-point 4 5)))

(area-rect r)
(perimieter-rect r)


