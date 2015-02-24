#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;;;;

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mv) (dot-product mv v)) m))

(define (transpose mat)
  (accumulate-n (lambda (heads tails) (map cons (reverse heads) tails)) null mat))


(define m '((1 2) (3 4)))
(define v '(5 7))

(dot-product v v)

(matrix-*-vector m v)

;; NOT DONE
(transpose m)
