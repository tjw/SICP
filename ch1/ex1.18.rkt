#lang racket

(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (mult-recur a b)
  (cond ((= b 0) 0)
        ((< b 0) (- (mult-recur a (- b))))
        ((even? b) (* 2 (mult-recur a (halve b))))
        (else (+ a (mult-recur a (- b 1))))))

; 
(define (mult-iter a b)
  ; Takes a sum-so-far, and the factors. We'll treat this as if we were working in binary.
  (define (iter n a b)
    (cond ((= 0 b) n)
          ((even? b) (iter n (double a) (halve b)))
          (else (iter (+ n a) (double a) (halve (- b 1))))))
  
  (if (< b 0)
      (- (mult-iter a (- b)))
      (iter 0 a b)))

(mult-recur -3 7)
(mult-recur 3 -7)
(mult-recur 3 7)
(mult-recur 456 123)

(mult-iter -3 7)
(mult-iter 3 -7)
(mult-iter 3 7)
(mult-iter 456 123)
