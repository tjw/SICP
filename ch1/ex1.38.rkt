#lang racket

(define (cont-frac-iter n d k)
  (define (step i prev)
    (cond ((= i 0) prev)
          (else (step (- i 1)
                      (/ (n i) (+ (d i) prev))))))
  (step k 0))
  
; The d values come in triples there the first is one, the last is one, and the middle is 2*t for t being the index of the triplet (starting at 1)
; Writing this as its own function for easier testing.
(define (div a b) (/ (- a (remainder a b)) b)) ; helper to do truncating division

(define (d i)
  (let ((t (+ 1 (div i 3))))
    (if (= (remainder (- i 1) 3) 1)
        (* 2 t)
        1)))
;(d 1)
;(d 2)
;(d 3)
;(d 4)
;(d 5)
;(d 6)
;(d 7)
;(d 8)
;(d 9)
;(d 10)
;(d 11)
;(d 12)
;(d 13)

; 2.7182818284590455
(+ 2.0 (cont-frac-iter (lambda (i) 1.0) d 10000))
