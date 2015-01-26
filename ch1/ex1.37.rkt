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

(cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; 0.6180555555555556

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; 0.6180555555555556

(/ 1 1.6180327868852458) ; 0.6180344478216819