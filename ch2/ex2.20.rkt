#lang racket

(define (parity n)
  (if (odd? n) 1 0))

(define (same-parity n . ns)
  (define (all-with-parity p ns)
    (cond 
      ((null? ns) ns)
      ((= p (parity (car ns))) (cons (car ns) (all-with-parity p (cdr ns))))
      (else (all-with-parity p (cdr ns)))))
  (all-with-parity (parity n) (cons n ns)))



(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)




    
    