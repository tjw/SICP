#lang racket

(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cdr mobile))


(define (make-branch length structure)
  (list length structure))

(define (branch-length b)
  (car b))
(define (branch-structure b)
  (cdr b))

(define (branch-weight branch)
  (let ((bs (branch-structure branch)))
    (if (pair? bs)
        (total-weight bs)
        bs)))
      
(define (total-weight mobile)
  (if (null? mobile) 0
      (+ (branch-weight (left-branch mobile))
         (branch-weight (right-branch mobile)))))


(define m
  (make-mobile
   (make-mobile
    (make-branch 10 (make-mobile (make-branch 5 2) (make-branch 4 5)))
    (make-branch 8 10))
   (make-branch 5 (make-mobile (make-branch 1 3) (make-branch 6 7)))))

(total-weight m)

; cdr violation
; not done balanced bits
    