#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ; 1024

(A 2 4) ; 65536

(A 3 3) ; 65536


(define (f n) (A 0 n))
; expands to the second case in the cond, '(* 2 y)', so this is 2n
(f 1) ; 2
(f 2) ; 4
(f 3) ; 6

(define (g n) (A 1 n))
; Hits the else case and becomes (A 0 (A 1 (- n 1)))
; --> (* 2 (A 1 (- n 1)))
; --> (* 2 (A 0 (A 1 (- n 2))))
; --> (* 2 (* 2 (A 1 (- n 2)))), etc.
; for n = 1
; (g 1) -> (A 1 1)
;       -> 2
; (g 2) -> (A 1 2)
;       -> (A 0 (A 1 1)
;       -> (A 0 2)
;       -> (* 2 2)
;       -> 4
; (g 3) -> (A 1 3)
;       -> (A 0 (A 1 2))
;       -> (* 2 (A 1 2))
;       -> 8
; (g 4) -> (A 1 4)
;       -> (A 0 (A 1 3))
;       -> (* 2 8)
;       -> 16
; g -> 2^n

(g 1) ; 2
(g 2) ; 4
(g 3) ; 8
(g 4) ; 16

(define (h n) (A 2 n))
; (h n) -> (A 2 n)
;       -> (A 1 (A 2 (- n 1)))
;       -> (A 0 (A 1 (- (A 2 (- n 1)) 1)))
;       -> (* 2 (A 1 (- (A 2 (- n 1)) 1)))
(h 1) ; 2
(h 2) ; 4
(h 3) ; 16
(h 4) ; 65536
(h 5) ; 
; (h n) -> 2^(2^(2^...) with n 2s


