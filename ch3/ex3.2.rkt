#lang racket

(define (make-monitored f)
  (define call-count 0)
  (lambda (arg)
    (cond ((eq? arg 'how-many-calls?) call-count)
          ((eq? arg 'reset-count) (set! call-count 0))
          (else (begin (set! call-count (+ call-count 1))
                       (f arg))))))


(define s (make-monitored sqrt))

(s 100)
(s 80)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)