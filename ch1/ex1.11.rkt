#lang racket

;; Recursive version
(define (f-recur n)
  (cond ((< n 3) n)
        (else (+ (f-recur (- n 1))
                 (* 2 (f-recur (- n 2)))
                 (* 3 (f-recur (- n 3)))))))

;; Iterative version
(define (f-iter n)
  ; takes the current i, a limit, and f(i-1), f(i-2), and f(i-3) values, returns f(i)
  (define (iter i limit fi1 fi2 fi3)
    (define fi (+ fi1 (* 2 fi2) (* 3 fi3))) ; we'll use the value of f(n) no matter what
    (if (= i limit)
        fi ; done
        
        ; substituting i for i+1: f(i+1) = f(i) + 2f(i-1) + 3f(i-2)
        (iter (+ 1 i) limit fi fi1 fi2)))
    
  (cond ((< n 3) n)
        ;; start iteration at 3 and pass in f(n-1), f(n-2), f(n-3)
        (else (iter 3 n 2 1 0))))

(f-recur 0)
(f-recur 1)
(f-recur 2)
(f-recur 3)
(f-recur 4)
(f-recur 5)
(f-recur 6)
(f-recur 7)

(f-iter 0)
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 6)
(f-iter 7)
