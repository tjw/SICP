#lang racket


(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-pi trials)
  (define percent-inside-circle (monte-carlo trials inside-unit-circle?))
  (display percent-inside-circle) (newline)
  (define circle-area (* 4 percent-inside-circle))
  circle-area) ; seems wrong since my circle has a radius of 1, so this should be 2*pi

(define (unit-random)
  (- (* 2 (random)) 1))

(define (inside-unit-circle?)
  (let* ((x (unit-random))
         (y (unit-random)))
    ;(display x) (display ", ") (display y)
    ;(newline)
    (< (+ (* x x) (* y y)) 1)))

(+ 0.0 (estimate-pi 10000000)) ; cast to float
