#lang racket

; give ordered-list set union that is O(n)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((h1 (car set1))
                    (h2 (car set2))
                    (t1 (cdr set1))
                    (t2 (cdr set2)))
                (cond ((= h1 h2) (cons h1 (union-set t1 t2)))
                      ((< h1 h2) (cons h1 (union-set t1 set2)))
                      (else (cons h2 (union-set set1 t2))))))))


(union-set (list 1) (list 2))
(union-set (list 2) (list 1))
(union-set (list 1) (list 1))
(union-set (list 2) (list 1 3))