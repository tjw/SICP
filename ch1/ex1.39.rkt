#lang racket

; exponent function from 1.16, though this is inefficient since it redoes a lot of work for each step when used in cont-frac-iter
(define (expt b n)
  (define (iter a b n)
    (cond ((= 0 n) a)
          ((even? n) (iter (* a a) b (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (iter b b (- n 1)))))


(define (cont-frac-iter n d k)
  (define (step i acc)
    (cond ((= i 0) acc)
          ((= i k) (/ (n i) (d i)))
          (else (step (- i 1)
                      (/ (n (- i 1)) (+ (d (- i 1)) acc))))))
  (step k 0))

(define (tan-cf x k) (cont-frac-iter (lambda (i) (expt x i))
                                     (lambda (i) (+ 1 (* 2 i)))
                                     k))

; not right... tried tweaking cont-frac-iter from previous exercises and got differnt wrong answer
(expt 2 3)
(tan-cf 0.4 10)
(tan 0.4)