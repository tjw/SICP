#lang racket

(define (cont-frac-iter n d k)
  (define (step i prev)
    (cond ((= i 0) prev)
          (else (step (- i 1)
                      (/ (n i) (+ (d i) prev))))))
  (step k 0))
                
(define (cont-frac-recur n d k)
  (define (step i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n k) (+ (d k) (step (+ 1 i))))))
  
  (step 1))

(cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; 0.6180555555555556

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; 0.6180555555555556

(/ 1 1.6180327868852458) ; 0.6180344478216819