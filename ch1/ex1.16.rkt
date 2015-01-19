#lang racket

(define (even? n)
  (= (remainder n 2) 0))

; probably a better way to do this, but the top-level cond ensures that 'a' in `iter` isn't 1 and so that a*a and a*b do something.
(define (expt b n)
  (define (iter a b n)
    (cond ((= 0 n) a)
          ((even? n) (iter (* a a) b (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (iter b b (- n 1)))))

(expt 3 99)