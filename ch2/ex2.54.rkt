#lang racket

(define (equal? a b)
  (if (eq? a b) #t ; null and atoms
      (if (and (list? a) (list? b))
          (and (equal? (car a) (car b))
               (equal? (cdr a) (cdr b)))
          #f)))

(equal? (list 1) (list 1))
(equal? '(a (b c) (d e)) '(a b c d e))