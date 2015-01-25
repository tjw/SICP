#lang racket

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (add-term total k)
    (define yk (f (+ a (* k h))))
    (define c (cond ((= 0 k) 1)
                     ((= n k) 1)
                     ((even? k) 2)
                     (else 4)))
                      
      
    (if (= k n)
        total
        (add-term (+ total (* c yk)) (+ 1 k))))
  
  (* (/ h 3) (add-term 0.0 0)))

(define (cube x) (* x x x))

(integral cube 0 1 100) ; 0.24666666666666667
(integral cube 0 1 1000) ; 0.2496666666666667
