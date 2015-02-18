#lang racket

(define (for-each f items)
  (let ((dummy (map f items)))
    #t))

(for-each 
 (lambda (x) (display x) (newline))
 (list 57 321 88))

