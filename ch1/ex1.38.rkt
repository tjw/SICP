#lang racket

(define (cont-frac-iter n d k)
  (define (step i acc)
    (cond ((= i 0) acc)
          (else (step (- i 1)
                      (/ (n (- i 1)) (+ (d (- i 1)) acc))))))
  (step k 0))

(define (cont-frac-recur n d k)
  (define (step i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n k) (+ (d k) (step (+ 1 i))))))
  
  (step 1))
  
; The d values come in triples there the first is one, the last is one, and the middle is 2*t for t being the index of the triplet (starting at 1)
; Writing this as its own function for easier testing.
(define (div a b) (/ (- a (remainder a b)) b)) ; helper to do truncating division

(define (d i)
  (let ((t (+ 1 (div i 3))))
    (if (= (remainder (- i 1) 3) 1)
        (* 2 t)
        1)))
(d 1)
(d 2)
(d 3)
(d 4)
(d 5)
(d 6)
(d 7)
(d 8)
(d 9)
(d 10)
(d 11)
(d 12)
(d 13)

; Not coming up right... getting ~2.58 with iterative, ~2.618 with iterative, instead of ~2.71828
(+ 2.0 (cont-frac-recur (lambda (i) 1.0) d 10000))
                  
