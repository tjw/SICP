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
  (/ 4 (monte-carlo trials inside-unit-circle?)))

(define (unit-random)
  (- (* 2 (random)) 1))

(define (inside-unit-circle?)
  (let* ((x (unit-random))
         (y (unit-random)))
    ;(display x) (display ", ") (display y)
    ;(newline)
    (< (+ (* x x) (* y y)) 1)))

(estimate-pi 10000)
