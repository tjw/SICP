#lang racket

(define logB 
    (lambda (x B) 
      (/ (log x) (log B))))

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (count-factors n p)
  (cond ((= n 1) 0)
        ((= 0 (remainder n p)) (+ 1 (count-factors (/ n p) p)))
        (else 0)))
        
(define (car p)
  (count-factors p 2))
(define (cdr p)
  (count-factors p 3))

(car (cons 5 6))
(cdr (cons 5 6))
