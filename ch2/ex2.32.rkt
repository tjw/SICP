#lang racket

(define (subsets s)
  (if (null? s) (list s)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; base case gives us our initial '(())
; let procdues the subsets for the smaller input set
; final `append` expands smaller subsets by appending the smaller subset (w/o s) and the larger subsets with s.
(subsets (list 1 2 3 4))


